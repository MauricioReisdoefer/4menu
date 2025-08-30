import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/models/produto_model.dart';
import 'package:newproject/components/logo_banner.dart';

class ProdutosWidget1 extends StatelessWidget {
  final Map<String, List<Produto>> categorias;

  const ProdutosWidget1({super.key, required this.categorias});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: categorias.entries.map((entry) {
          final categoria = entry.key;
          final produtos = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título da categoria
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  categoria,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              // Lista de produtos da categoria
              ...produtos.map((produto) {
                return Card(
                  color: Colors.black87,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: Image.asset(
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
                    subtitle: Text(
                      produto.descricao,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: Text(
                      "R\$${produto.preco.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }).toList(),

              const SizedBox(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class CardapioLayout1 extends StatefulWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<Produto>> categorias;

  const CardapioLayout1({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  State<CardapioLayout1> createState() => _CardapioLayout1State();
}

class _CardapioLayout1State extends State<CardapioLayout1> {
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
          ProdutosWidget1(categorias: widget.categorias),
        ],
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'restaurantes'),
    );
  }
}
