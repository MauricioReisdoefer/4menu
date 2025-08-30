import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/models/produto_model.dart';
import 'package:newproject/components/logo_banner.dart';

class CategoriasWidget2 extends StatelessWidget {
  final String categoriaSelecionada;
  final Map<String, List<Produto>> categorias;
  final Function(String) onCategoriaSelecionada;

  const CategoriasWidget2({
    super.key,
    required this.categoriaSelecionada,
    required this.categorias,
    required this.onCategoriaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      children: categorias.keys.map((categoria) {
        final isSelected = categoria == categoriaSelecionada;
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.orange : Colors.grey[300],
            foregroundColor: isSelected ? Colors.white : Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          onPressed: () => onCategoriaSelecionada(categoria),
          child: Text(categoria),
        );
      }).toList(),
    );
  }
}

class ProdutosWidget2 extends StatelessWidget {
  final List<Produto> produtos;

  const ProdutosWidget2({super.key, required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(produto.foto),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.darken,
                ),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    produto.descricao,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "R\$${produto.preco.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.orange, fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardapioLayout2 extends StatefulWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<Produto>> categorias;

  const CardapioLayout2({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  State<CardapioLayout2> createState() => _CardapioLayout2State();
}

class _CardapioLayout2State extends State<CardapioLayout2> {
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
          CategoriasWidget2(
            categoriaSelecionada: categoriaSelecionada,
            categorias: widget.categorias,
            onCategoriaSelecionada: (categoria) {
              setState(() {
                categoriaSelecionada = categoria;
              });
            },
          ),
          const SizedBox(height: 10),
          ProdutosWidget2(produtos: widget.categorias[categoriaSelecionada]!),
        ],
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'restaurantes'),
    );
  }
}
