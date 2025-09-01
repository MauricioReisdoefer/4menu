import 'package:flutter/material.dart';

class CardapioForm extends StatefulWidget {
  const CardapioForm({Key? key}) : super(key: key);

  @override
  State<CardapioForm> createState() => _CardapioFormState();
}

class _CardapioFormState extends State<CardapioForm> {
  List<Map<String, dynamic>> secoes = [];

  Widget cardapioSecaoDinamica(Key id, String titulo) {
    List<Map<String, dynamic>> itens = [];

    return StatefulBuilder(
      builder: (context, setStateSecao) {
        return Card(
          color: Colors.black54,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        setState(() {
                          secoes.removeWhere((s) => s["id"] == id);
                        });
                      },
                    ),
                  ],
                ),
                ...itens.map((item) => item["widget"]).toList(),
                ElevatedButton(
                  onPressed: () {
                    TextEditingController nomeController = TextEditingController();
                    TextEditingController descController = TextEditingController();
                    TextEditingController precoController = TextEditingController();

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Adicionar Item"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(controller: nomeController, decoration: const InputDecoration(hintText: "Nome do Produto")),
                              TextField(controller: descController, decoration: const InputDecoration(hintText: "Descrição")),
                              TextField(controller: precoController, decoration: const InputDecoration(hintText: "Preço"), keyboardType: TextInputType.number),
                            ],
                          ),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar")),
                            ElevatedButton(
                              onPressed: () {
                                if (nomeController.text.isNotEmpty) {
                                  setStateSecao(() {
                                    itens.add({
                                      "id": UniqueKey(),
                                      "widget": Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(nomeController.text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                                                if (descController.text.isNotEmpty)
                                                  Text(descController.text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                                                Text("R\$ ${precoController.text}", style: const TextStyle(color: Colors.orange, fontSize: 16, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.delete, color: Colors.redAccent),
                                            onPressed: () {
                                              setStateSecao(() {
                                                itens.removeWhere((i) => i["id"] == itens.last["id"]);
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    });
                                  });
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white10),
                  child: const Text("Adicionar Item", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Definindo o Cardápio", style: TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            TextEditingController secaoController = TextEditingController();
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color(0xFF1F1E1E),
                  title: const Text("Nome da Seção", style: TextStyle(color: Colors.white)),
                  content: TextField(
                    controller: secaoController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: "Ex: Entradas, Pratos, Bebidas...",
                      hintStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancelar", style: TextStyle(color: Colors.white))),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                      onPressed: () {
                        if (secaoController.text.isNotEmpty) {
                          setState(() {
                            secoes.add({"id": UniqueKey(), "titulo": secaoController.text});
                          });
                        }
                        Navigator.pop(context);
                      },
                      child: const Text("Adicionar", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: const Text("Adicionar Seção", style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 20),
        ...secoes.map((secao) => cardapioSecaoDinamica(secao["id"], secao["titulo"])).toList(),
      ],
    );
  }
}