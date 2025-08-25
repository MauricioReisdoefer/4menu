import 'package:flutter/material.dart';
import 'package:newproject/screens/cardapio.dart';
import 'package:newproject/screens/home.dart';
import 'package:newproject/screens/restaurantes.dart';

class Resgister extends StatefulWidget {
  const Resgister({super.key});

  @override
  State<Resgister> createState() => _ResgisterState();
}

class _ResgisterState extends State<Resgister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/4menu.png',
                height: 200,
                width: 200,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome
            Text("Nome", style: TextStyle(color: Colors.white70)),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Digite seu nome",
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Email
            Text("E-mail", style: TextStyle(color: Colors.white70)),
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Digite seu e-mail",
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Senha
            Text("Senha", style: TextStyle(color: Colors.white70)),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility_off, color: Colors.white54),
                hintText: "Digite sua senha",
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Confirmar Senha
            Text("Confirmar Senha", style: TextStyle(color: Colors.white70)),
            TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.visibility_off, color: Colors.white54),
                hintText: "Confirme sua senha",
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
              ),
            ),
            SizedBox(height: 32),

            // Botão cadastrar
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text("Cadastrar", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
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
