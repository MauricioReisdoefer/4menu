import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/restaurantes.dart';

class RestauranteForm extends StatefulWidget {
  final ValueChanged<String> onNomeChanged;
  final ValueChanged<Color> onCorPrimariaChanged;
  final ValueChanged<Color> onCorSecundariaChanged;

  const RestauranteForm({
    Key? key,
    required this.onNomeChanged,
    required this.onCorPrimariaChanged,
    required this.onCorSecundariaChanged,
  }) : super(key: key);

  @override
  State<RestauranteForm> createState() => _RestauranteFormState();
}

class _RestauranteFormState extends State<RestauranteForm> {
  final TextEditingController controllerNome = TextEditingController();
  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

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
                setState(() {
                  if (isPrimaria) {
                    corPrimaria = color;
                    widget.onCorPrimariaChanged(color);
                  } else {
                    corSecundaria = color;
                    widget.onCorSecundariaChanged(color);
                  }
                });
              },
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
          ],
        );
      },
    );
  }

  Widget layoutOption(bool selected) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: selected ? corPrimaria : Colors.transparent, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.dashboard, size: 40, color: Colors.black54),
    );
  }

  Widget colorSelector({
    required String titulo,
    required String descricao,
    required Color corSelecionada,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/gradient-color.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    descricao,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nome
        Text("Título do Restaurante", style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          controller: controllerNome,
          onChanged: widget.onNomeChanged,
          decoration: InputDecoration(
            hintText: "Nome genérico...",
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 30),

        // Layout
        Text("Escolha o Layout", style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 12),
        Wrap(spacing: 16, runSpacing: 16, children: [
          layoutOption(true),
          layoutOption(false),
          layoutOption(false),
          layoutOption(false),
        ]),
        const SizedBox(height: 30),

        // Cores
        Text("Definindo as Cores", style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 10),
        colorSelector(
          titulo: "Cor Primária",
          descricao: "Vai ser aplicada na maioria das coisas, sejam botões, alguns textos e preços.",
          corSelecionada: corPrimaria,
          onTap: () => _abrirColorPicker(true),
        ),
        colorSelector(
          titulo: "Cor Secundária",
          descricao: "Vai ser aplicada como contraste das cores primárias, em botões selecionados, outros textos, entre outros.",
          corSelecionada: corSecundaria,
          onTap: () => _abrirColorPicker(false),
        ),
      ],
    );
  }
}