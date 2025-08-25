import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/restaurantes.dart';
import 'package:newproject/screens/cardapio.dart';
import 'package:newproject/screens/criar_restaurante.dart';
import 'package:newproject/screens/inicio.dart';
import 'package:newproject/screens/resgister.dart';

class Biblioteca extends StatefulWidget {
  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
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
          title: Text(
            isPrimaria ? "Escolha a Cor Primária" : "Escolha a Cor Secundária",
          ),
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
        backgroundColor: const Color.fromARGB(255, 147, 142, 142),
        title: const Text("Restaurantes Disponíveis"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cardapio(), // tua tela de cardápio
                  ),
                );
              },
              child: Restaurante(
                url:
                    'https://i0.wp.com/corujamusic.com.br/wp-content/uploads/2022/11/queen-made-in-heaven.jpg?ssl=1',
                nome: 'Meu tico',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'biblioteca'),
    );
  }
}
