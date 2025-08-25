import 'package:flutter/material.dart';
import 'package:newproject/screens/criar_restaurante.dart';
import 'package:newproject/screens/inicio.dart';
import 'package:newproject/screens/restaurantes.dart';

class RodapeRestaurante extends StatelessWidget {
  const RodapeRestaurante({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 12),
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
                MaterialPageRoute(builder: (context) => CriacaoRestauranteScreen()),
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
    );
  }
}