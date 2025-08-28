import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/restaurantes.dart';

class CriacaoRestauranteScreen extends StatefulWidget {
  @override
  State<CriacaoRestauranteScreen> createState() =>
      _CriacaoRestauranteScreenState();
}

class _CriacaoRestauranteScreenState extends State<CriacaoRestauranteScreen> {
  final TextEditingController controller_nome = TextEditingController();
  late String nome = controller_nome.text;

  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

  // 🔥 Lista de seções fica no State
  List<Map<String, dynamic>> secoes = [];

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
            style: TextStyle(fontWeight: FontWeight.bold),
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

  Widget layoutOption(bool selected) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: selected ? corPrimaria : Colors.transparent,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.dashboard, size: 40, color: Colors.black54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1E1E),
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Image.asset('assets/images/4menu.png', height: 150),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner com imagem e texto
            SizedBox(
              height: 390,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/banner-restaurante.png'),
                  Container(color: Colors.black.withOpacity(0.5)),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 80,
                            vertical: 30,
                          ),
                          child: Text(
                            'Criação de Restaurante',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Título do Restaurante",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller_nome,
                    decoration: InputDecoration(
                      hintText: "Nome genérico...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Text(
                    "Escolha o Layout",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      layoutOption(true),
                      layoutOption(false),
                      layoutOption(false),
                      layoutOption(false),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Text(
                    "Definindo o Cardápio",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  ElevatedButton(
                    onPressed: () {
                      TextEditingController secaoController =
                          TextEditingController();
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Nome da Seção"),
                            content: TextField(
                              controller: secaoController,
                              decoration: const InputDecoration(
                                hintText: "Ex: Entradas, Pratos, Bebidas...",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancelar"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (secaoController.text.isNotEmpty) {
                                    setState(() {
                                      secoes.add({
                                        "id": UniqueKey(),
                                        "titulo": secaoController.text,
                                      });
                                    });
                                  }
                                  Navigator.pop(context);
                                },
                                child: const Text("Adicionar"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corPrimaria,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      "Adicionar Seção",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // renderiza as seções
                  ...secoes.map((secao) {
                    return cardapioSecaoDinamica(secao["id"], secao["titulo"]);
                  }).toList(),

                  const SizedBox(height: 40),
                  Text(
                    "Definindo as Cores",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "Cor Primária",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Vai ser aplicada na maioria das coisas, sejam botões, alguns textos e preços.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _abrirColorPicker(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corPrimaria,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Selecionar Cor Primária"),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "Cor Secundária",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Vai ser aplicada como contraste das cores primárias, em botões selecionados, outros textos, entre outros.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => _abrirColorPicker(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: corSecundaria,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Selecionar Cor Secundária"),
                  ),

                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Restaurante novo_restaurante = Restaurante(
                          url: "sdfsdf",
                          nome: nome,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: corPrimaria,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Finalizar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'criar'),
    );
  }

  // Componente que monta seção dinâmica
  Widget cardapioSecaoDinamica(Key id, String titulo) {
    List<Map<String, dynamic>> itens = [];

    return StatefulBuilder(
      builder: (context, setStateSecao) {
        return Card(
          color: Colors.black54,
          margin: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titulo,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                const SizedBox(height: 8),

                // lista de itens
                ...itens.map((item) => item["widget"]).toList(),

                ElevatedButton(
                  onPressed: () {
                    TextEditingController nomeController =
                        TextEditingController();
                    TextEditingController descController =
                        TextEditingController();
                    TextEditingController precoController =
                        TextEditingController();

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Adicionar Item"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: nomeController,
                                decoration: const InputDecoration(
                                  hintText: "Nome do Produto",
                                ),
                              ),
                              TextField(
                                controller: descController,
                                decoration: const InputDecoration(
                                  hintText: "Descrição",
                                ),
                              ),
                              TextField(
                                controller: precoController,
                                decoration: const InputDecoration(
                                  hintText: "Preço",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancelar"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (nomeController.text.isNotEmpty) {
                                  setStateSecao(() {
                                    itens.add({
                                      "id": UniqueKey(),
                                      "widget": Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  nomeController.text,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                if (descController
                                                    .text
                                                    .isNotEmpty)
                                                  Text(
                                                    descController.text,
                                                    style: const TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                Text(
                                                  "R\$ ${precoController.text}",
                                                  style: const TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.redAccent,
                                            ),
                                            onPressed: () {
                                              setStateSecao(() {
                                                itens.removeWhere(
                                                  (i) =>
                                                      i["id"] ==
                                                      itens.last["id"],
                                                );
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    "Adicionar Item",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
