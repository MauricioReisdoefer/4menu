import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home(), debugShowCheckedModeBanner: false));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/4menu.png', height: 250, width: 250),
        toolbarHeight: 150,
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
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
      ),
      body: ListView(
        children: [
          // 🔹 Banner com imagem de fundo
          SizedBox(
            height: 700,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/background.jpeg', fit: BoxFit.cover),
                Container(color: Colors.black.withOpacity(0.5)),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(child: Image.asset('assets/images/4menu.png')),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Bem-vindo ao 4Menu, aqui você vai ter disponibilidade a vários restaurantes e seus cardápios. Cadastre-se e adicione seu restaurante ao 4Menu já!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.all(20),
                        ),
                        child: Icon(Icons.arrow_downward, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Seção "Adicione Seu Restaurante"
          Row(
            children: [
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(10),
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
                      "Quer adicionar seu restaurante? \n Crie seu perfil e entre na aba 'Criar',\n onde terá disponibilidade de criar\n sua página para nosso site!",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text("Register"),
                ),
              ),
            ],
          ),

          // 🔹 Seção "Quem Somos"
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 50,
                      color: Colors.orange,
                    ), // tu pode usar uma imagem também
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: Text("Nosso Site"),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    "Somos a empresa 4Chefs, onde criamos softwares voltados a restaurantes e chefs de cozinha. Para saber mais, acesse nosso site ao lado.",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
