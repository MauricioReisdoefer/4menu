import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/models/produto_model.dart';
import 'package:newproject/components/logo_banner.dart';

class CategoriasWidget0 extends StatelessWidget {
  final String categoriaSelecionada;
  final Map<String, List<Produto>> categorias;
  final Function(String) onCategoriaSelecionada;

  const CategoriasWidget0({
    super.key,
    required this.categoriaSelecionada,
    required this.categorias,
    required this.onCategoriaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categorias.keys.map((categoria) {
          final isSelected = categoria == categoriaSelecionada;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(categoria),
              selected: isSelected,
              onSelected: (_) => onCategoriaSelecionada(categoria),
              selectedColor: Colors.orange,
              backgroundColor: Colors.grey[300],
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ProdutosWidget0 extends StatefulWidget {
  final List<Produto> produtos;

  const ProdutosWidget0({super.key, required this.produtos});

  @override
  State<ProdutosWidget0> createState() => _ProdutosWidget0State();
}

class _ProdutosWidget0State extends State<ProdutosWidget0> {
  final List<Produto> selecionados = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.produtos.length,
        itemBuilder: (context, index) {
          final produto = widget.produtos[index];
          final marcado = selecionados.contains(produto);

          return Card(
            color: Colors.black87,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: CheckboxListTile(
              activeColor: Colors.orange,
              checkColor: Colors.white,
              secondary: Image.asset(
                produto.foto,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(
                produto.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.descricao,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "R\$${produto.preco.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                ],
              ),
              value: marcado,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selecionados.add(produto);
                  } else {
                    selecionados.remove(produto);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class CardapioLayout0 extends StatefulWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<Produto>> categorias;

  const CardapioLayout0({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  State<CardapioLayout0> createState() => _CardapioLayout0State();
}

class _CardapioLayout0State extends State<CardapioLayout0> {
  late String categoriaSelecionada;

  @override
  void initState() {
    super.initState();
    categoriaSelecionada = widget.categorias.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Center(child: LogoWidget(urlImg: widget.urlImg)),
      ),
      body: Column(
        children: [
          BannerNomeWidget(
            urlBanner: widget.urlBanner,
            nomeRestaurante: widget.nomeRestaurante,
          ),
          CategoriasWidget0(
            categoriaSelecionada: categoriaSelecionada,
            categorias: widget.categorias,
            onCategoriaSelecionada: (categoria) {
              setState(() {
                categoriaSelecionada = categoria;
              });
            },
          ),
          const SizedBox(height: 10),
          ProdutosWidget0(produtos: widget.categorias[categoriaSelecionada]!),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: aqui depois a gente manda pro banco de dados
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text("Fazer Pedido"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'restaurantes'),
    );
  }
}
