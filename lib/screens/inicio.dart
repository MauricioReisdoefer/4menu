import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // <- pra controlar status bar
import 'package:newproject/components/footer.dart';
import 'package:newproject/screens/register/resgister.dart';
import 'package:newproject/screens/restaurant/restaurantes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newproject/screens/login/login.dart';
import 'package:newproject/screens/create_restaurant/criar_restaurante.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  String? _jwtToken;

  @override
  void initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _jwtToken = prefs.getString('jwt_token');
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Image.asset('assets/images/4menu.png', height: 150),
        actions: [
          if (_jwtToken != null && _jwtToken!.isNotEmpty)
            IconButton(
              onPressed: () {
                // Navegar para tela de perfil
              },
              icon: Icon(Icons.person, color: Colors.white),
            )
          else ...[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: Text("Sign In"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Resgister()),
                );
              },
              child: Text("Registrar"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
            ),
          ],
          const SizedBox(width: 16),
        ],
      ),

      body: ListView(
        controller: _scrollController,
        children: [
          // Banner de entrada
          SizedBox(
            height: 650,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/background.jpeg', fit: BoxFit.cover),
                Container(color: Colors.black.withOpacity(0.5)),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/4menu.png', height: 320),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Bem-vindo ao 4Menu! Aqui você tem acesso a vários restaurantes e cardápios. Cadastre-se e adicione seu restaurante agora mesmo!",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _scrollToBottom,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Adicione Seu Restaurante
          Container(
            height: 300,
            color: Colors.black,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Adicione Seu Restaurante",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Quer adicionar seu restaurante? Crie seu perfil e entre na aba 'Criar', onde terá disponibilidade de criar sua página para nosso site!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Resgister()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Registrar", style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),

          // Quem Somos
          Container(
            height: 300,
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/4chefs.png',
                        width: 140,
                        height: 140,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Quem Somos?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Somos a empresa 4Chefs, onde criamos softwares voltados a restaurantes e chefs de cozinha. Para saber mais, acesse nosso site ao lado.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: RodapeRestaurante(abaAtual: 'home'),
    );
  }
}
