import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cardapio_bloc.dart';
import 'cardapio_event.dart';
import 'cardapio_state.dart';

class CardapioForm extends StatelessWidget {
  const CardapioForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardapioBloc(),
      child: BlocBuilder<CardapioBloc, CardapioState>(
        builder: (context, state) {
          final bloc = context.read<CardapioBloc>();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Definindo o Cardápio",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final secaoController = TextEditingController();

                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        backgroundColor: const Color(0xFF1F1E1E),
                        title: const Text(
                          "Nome da Seção",
                          style: TextStyle(color: Colors.white),
                        ),
                        content: TextField(
                          controller: secaoController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            hintText: "Ex: Entradas, Pratos, Bebidas...",
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () {
                              if (secaoController.text.isNotEmpty) {
                                bloc.add(AdicionarSecao(secaoController.text));
                              }
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Adicionar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text("Adicionar Seção",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              ...state.secoes.map((secao) {
                return Card(
                  color: Colors.black54,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              secao.titulo,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.redAccent),
                              onPressed: () {
                                bloc.add(RemoverSecao(secao.id));
                              },
                            ),
                          ],
                        ),
                        ...secao.itens.map((item) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.nome,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    if (item.descricao.isNotEmpty)
                                      Text(item.descricao,
                                          style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14)),
                                    Text("R\$ ${item.preco}",
                                        style: const TextStyle(
                                            color: Colors.orange,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,
                                    color: Colors.redAccent),
                                onPressed: () {
                                  bloc.add(RemoverItem(
                                      secaoId: secao.id, itemId: item.id));
                                },
                              ),
                            ],
                          );
                        }).toList(),
                        ElevatedButton(
                          onPressed: () {
                            final nomeController = TextEditingController();
                            final descController = TextEditingController();
                            final precoController = TextEditingController();

                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const Text("Adicionar Item"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: nomeController,
                                        decoration: const InputDecoration(
                                            hintText: "Nome do Produto"),
                                      ),
                                      TextField(
                                        controller: descController,
                                        decoration: const InputDecoration(
                                            hintText: "Descrição"),
                                      ),
                                      TextField(
                                        controller: precoController,
                                        decoration: const InputDecoration(
                                            hintText: "Preço"),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
                                        child: const Text("Cancelar")),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (nomeController.text.isNotEmpty) {
                                          bloc.add(AdicionarItem(
                                            secaoId: secao.id,
                                            nome: nomeController.text,
                                            descricao: descController.text,
                                            preco: precoController.text,
                                          ));
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text("Adicionar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white10),
                          child: const Text("Adicionar Item",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
