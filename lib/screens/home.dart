import 'package:flutter/material.dart';

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
          SizedBox(width: 8),
          TextButton(
            onPressed: () {},
            child: Text("Register"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
            ),
          ),
          SizedBox(width: 16),
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
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.all(18),
                        ),
                        child: Icon(Icons.arrow_downward, color: Colors.white),
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
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("Register"),
                ),
              ],
            ),
          ),

          // 🔹 Quem Somos
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/4chefs.png', // não esquece da extensão .png
                        width: 10, // 🔹 Ajuste a largura
                        height: 10, // 🔹 Ajuste a altura
                        fit: BoxFit
                            .contain, // 🔹 Garante que a imagem não estique
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Nosso Site"),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
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

      // 🔹 BottomNavigationBar (igual sua foto)
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
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
