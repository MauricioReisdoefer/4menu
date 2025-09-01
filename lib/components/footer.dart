import 'package:flutter/material.dart';
import 'package:newproject/screens/biblioteca.dart';
import 'package:newproject/screens/create_restaurant/criar_restaurante.dart';
import 'package:newproject/screens/inicio.dart';
import 'package:newproject/screens/restaurantes.dart';

class RodapeRestaurante extends StatelessWidget {
  final String abaAtual; // recebe o nome da tela atual

  const RodapeRestaurante({super.key, required this.abaAtual});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 31, 30, 30),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Início
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: abaAtual == "home" ? Colors.orange : Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  "Início",
                  style: TextStyle(
                    color: abaAtual == "home" ? Colors.orange : Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Registrar
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Biblioteca()),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.favorite,
                  color: abaAtual == "biblioteca"
                      ? Colors.orange
                      : Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  "Biblioteca",
                  style: TextStyle(
                    color: abaAtual == "biblioteca"
                        ? Colors.orange
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Restaurantes
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Restaurantes()),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.restaurant,
                  color: abaAtual == "restaurantes"
                      ? Colors.orange
                      : Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  "Restaurantes",
                  style: TextStyle(
                    color: abaAtual == "restaurantes"
                        ? Colors.orange
                        : Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Criar
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CriacaoRestauranteScreen(),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: abaAtual == "criar" ? Colors.orange : Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  "Criar",
                  style: TextStyle(
                    color: abaAtual == "criar" ? Colors.orange : Colors.white,
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
