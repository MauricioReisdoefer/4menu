import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/restaurantes.dart';
import 'package:newproject/screens/cardapio.dart';
import 'package:newproject/screens/home.dart';
import 'package:newproject/screens/resgister.dart';

class Restaurantes extends StatefulWidget {
  @override
  State<Restaurantes> createState() => _RestaurantesState();
}

class _RestaurantesState extends State<Restaurantes> {
  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

  void _mudarCorPrimaria(Color color) {
    setState(() {
      corPrimaria = color;
    });
  }

  void _mudarCorSecundaria(Color color) {
    setState(() {
      corSecundaria = color;
    });
  }

  void _abrirColorPicker(bool isPrimaria) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isPrimaria ? "Escolha a Cor Primária" : "Escolha a Cor Secundária"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: isPrimaria ? corPrimaria : corSecundaria,
              onColorChanged: (color) {
                if (isPrimaria) {
                  _mudarCorPrimaria(color);
                } else {
                  _mudarCorSecundaria(color);
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Criação de Restaurante"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Restaurante(url: '', nome: '',)
          ]
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