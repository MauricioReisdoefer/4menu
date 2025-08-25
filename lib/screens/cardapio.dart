import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/screens/home.dart';
import 'package:newproject/screens/resgister.dart';
import 'package:newproject/screens/restaurantes.dart';

class CriacaoRestauranteScreen extends StatefulWidget {
  @override
  State<CriacaoRestauranteScreen> createState() => _CriacaoRestauranteScreenState();
}

class _CriacaoRestauranteScreenState extends State<CriacaoRestauranteScreen> {
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
            const Text("Título do Restaurante", style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Nome genérico...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),

            const Text("Escolha o Layout", style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 80, height: 80, color: Colors.white),
                Container(width: 80, height: 80, color: Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 80, height: 80, color: Colors.white),
                Container(width: 80, height: 80, color: Colors.white),
              ],
            ),

            const SizedBox(height: 20),
            const Text("Definindo o Cardápio", style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: corPrimaria),
              child: const Text("Adicionar Seção"),
            ),
            const SizedBox(height: 20),

            const Text("Definindo as Cores", style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),

            // Cor Primária
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _abrirColorPicker(true),
                    style: ElevatedButton.styleFrom(backgroundColor: corPrimaria),
                    child: const Text("Cor Primária"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Cor Secundária
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _abrirColorPicker(false),
                    style: ElevatedButton.styleFrom(backgroundColor: corSecundaria),
                    child: const Text("Cor Secundária"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: corPrimaria,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text("Finalizar", style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: RodapeRestaurante()

    );
  }
}