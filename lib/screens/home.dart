import 'package:flutter/material.dart';
import 'package:newproject/screens/resgister.dart';
import 'package:newproject/screens/restaurantes.dart';
import 'cardapio.dart'; // 👉 importa tua página de cardápio

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () {},
            child: Text("Register"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),

      // 🔹 Corpo da tela
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
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.all(18),
                        ),
                        child: const Icon(Icons.arrow_downward, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Adicione Seu Restaurante
          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Adicione Seu Restaurante",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Quer adicionar seu restaurante? Crie seu perfil e entre na aba 'Criar', onde terá disponibilidade de criar sua página para nosso site!",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Register"),
                ),
              ],
            ),
          ),

          // 🔹 Quem Somos
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/4chefs.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Nosso Site"),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quem Somos?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Somos a empresa 4Chefs, onde criamos softwares voltados a restaurantes e chefs de cozinha. Para saber mais, acesse nosso site ao lado.",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
  color: Colors.black,
  padding: EdgeInsets.symmetric(vertical: 12),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      // Início
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.home, color: Colors.white),
            SizedBox(height: 4),
            Text("Início", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),

      // Registrar
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Resgister()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.person_add, color: Colors.white),
            SizedBox(height: 4),
            Text("Registrar", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),

      // Restaurantes
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurantes()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.restaurant, color: Colors.white),
            SizedBox(height: 4),
            Text("Restaurantes", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),

      // Criar
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CriacaoRestauranteScreen()),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.add_business, color: Colors.white),
            SizedBox(height: 4),
            Text("Criar", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ],
  ),
),

    );
  }
}