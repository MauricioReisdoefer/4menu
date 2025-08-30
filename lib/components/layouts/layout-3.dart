import 'package:flutter/material.dart';

class CardapioLayout3 extends StatelessWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<String>> categorias;

  const CardapioLayout3({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(nomeRestaurante),
              background: Image.network(urlBanner, fit: BoxFit.cover),
            ),
          ),
          ...categorias.entries.map(
            (entry) => SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                final item = entry.value[index - 1];
                return ListTile(
                  leading: const Icon(Icons.restaurant_menu),
                  title: Text(item),
                  trailing: const Icon(Icons.add),
                );
              }, childCount: entry.value.length + 1),
            ),
          ),
        ],
      ),
    );
  }
}
