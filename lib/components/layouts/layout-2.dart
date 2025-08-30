import 'package:flutter/material.dart';

class CardapioLayout2 extends StatelessWidget {
  final String urlImg;
  final String urlBanner;
  final String nomeRestaurante;
  final Map<String, List<String>> categorias;

  const CardapioLayout2({
    super.key,
    required this.urlImg,
    required this.urlBanner,
    required this.nomeRestaurante,
    required this.categorias,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nomeRestaurante)),
      body: ListView(
        children: [
          Image.network(urlBanner, height: 150, fit: BoxFit.cover),
          ...categorias.entries.map(
            (entry) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: entry.value
                      .map(
                        (item) => Card(
                          margin: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.fastfood, size: 40),
                                  const SizedBox(height: 8),
                                  Text(item),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
