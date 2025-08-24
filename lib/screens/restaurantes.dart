import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/restaurantes.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: corPrimaria,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Biblioteca"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Restaurantes"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Criar"),
        ],
      ),
    );
  }
}