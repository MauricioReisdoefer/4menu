import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newproject/components/footer.dart';

class Produto {
  final String nome;
  final String descricao;
  final double preco;
  final String foto;

  Produto({
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.foto,
  });
}

// LOGO
class LogoWidget extends StatelessWidget {
  final String urlImg;
  const LogoWidget({super.key, required this.urlImg});

  @override
  Widget build(BuildContext context) {
    return Image.asset(urlImg, height: 120, fit: BoxFit.contain);
  }
}

// BANNER e NOME
class BannerNomeWidget extends StatelessWidget {
  final String urlBanner;
  final String nomeRestaurante;
  const BannerNomeWidget({
    super.key,
    required this.urlBanner,
    required this.nomeRestaurante,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Text(
            nomeRestaurante,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Image.asset(
          urlBanner,
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}

// CATEGORIAS
class CategoriasWidget extends StatelessWidget {
  final String categoriaSelecionada;
  final Map<String, List<Produto>> categorias;
  final Function(String) onCategoriaSelecionada;

  const CategoriasWidget({
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

// PRODUTOS
class ProdutosWidget extends StatelessWidget {
  final List<Produto> produtos;

  const ProdutosWidget({super.key, required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Card(
            color: Colors.black87,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Image.asset(produto.foto, width: 60, fit: BoxFit.cover),
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
                style: const TextStyle(color: Colors.orange, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}

// TELA TODA
class Cardapio extends StatefulWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<Produto>> categorias;

  const Cardapio({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
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
          CategoriasWidget(
            categoriaSelecionada: categoriaSelecionada,
            categorias: widget.categorias,
            onCategoriaSelecionada: (categoria) {
              setState(() {
                categoriaSelecionada = categoria;
              });
            },
          ),
          const SizedBox(height: 10),
          ProdutosWidget(produtos: widget.categorias[categoriaSelecionada]!),
        ],
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'restaurantes'),
    );
  }
}
