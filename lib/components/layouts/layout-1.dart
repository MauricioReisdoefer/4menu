import 'package:flutter/material.dart';

class CardapioLayout1 extends StatelessWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<String>> categorias;

  const CardapioLayout1({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                urlBanner,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black.withOpacity(0.5),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Text(
                  nomeRestaurante,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ...categorias.entries.map(
                  (entry) => ExpansionTile(
                    title: Text(
                      entry.key,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: entry.value
                        .map(
                          (item) => ListTile(
                            title: Text(item),
                            trailing: const Icon(Icons.add_circle_outline),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
