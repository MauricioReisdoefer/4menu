import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_bloc.dart';
import 'form_state.dart';
import 'form_event.dart';

class RestauranteForm extends StatefulWidget {
  const RestauranteForm({Key? key}) : super(key: key);

  @override
  State<RestauranteForm> createState() => _RestauranteFormState();
}

class _RestauranteFormState extends State<RestauranteForm> {
  final TextEditingController controllerNome = TextEditingController();

  void _abrirColorPicker(BuildContext context, bool isPrimaria, Color corAtual) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isPrimaria ? "Escolha a Cor Primária" : "Escolha a Cor Secundária"),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: corAtual,
              onColorChanged: (color) {
                if (isPrimaria) {
                  context.read<RestaurantBloc>().add(RestaurantCorPrimariaChanged(color));
                } else {
                  context.read<RestaurantBloc>().add(RestaurantCorSecundariaChanged(color));
                }
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
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        // mantém controller sincronizado com o state
        controllerNome.value = controllerNome.value.copyWith(text: state.nome);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nome
            const Text("Título do Restaurante", style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              controller: controllerNome,
              onChanged: (value) => context.read<RestaurantBloc>().add(RestaurantNomeChanged(value)),
              decoration: InputDecoration(
                hintText: "Nome genérico...",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 30),

            // Cores
            const Text("Definindo as Cores", style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 10),
            colorSelector(
              titulo: "Cor Primária",
              descricao: "Vai ser aplicada na maioria das coisas, sejam botões, alguns textos e preços.",
              corSelecionada: state.corPrimaria,
              onTap: () => _abrirColorPicker(context, true, state.corPrimaria),
            ),
            colorSelector(
              titulo: "Cor Secundária",
              descricao: "Vai ser aplicada como contraste das cores primárias, em botões selecionados, outros textos, entre outros.",
              corSelecionada: state.corSecundaria,
              onTap: () => _abrirColorPicker(context, false, state.corSecundaria),
            ),
          ],
        );
      },
    );
  }
}
