import 'package:flutter/material.dart';
import 'package:newproject/screens/resgister.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        title: Image.asset('assets/images/4menu.png', height: 150),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Sign In"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Resgister()),
                );
              });
            },
            child: Text("Register"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),

      // Corpo da tela
      body: ListView(
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
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.all(22),
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
            height: 370,
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
                  child: const Text("Register"),
                ),
              ],
            ),
          ),

          // Quem Somos
          Container(
            height: 300,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/4chefs.png',
                        width: 130,
                        height: 130,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Nosso Site"),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
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
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Resgister()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "BIBLIOTECA",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "RESTAURANTES",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: "CRIAR"),
        ],
      ),
    );
  }
}
