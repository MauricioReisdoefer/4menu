import 'package:flutter/material.dart';

class Restaurante extends StatelessWidget {
  final String url;
  final String nome;

  const Restaurante({required this.url, required this.nome});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16), // borda arredondada
      child: Stack(
        children: [
          Image.network(
            url,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover, // preenche sem distorcer
            loadingBuilder: (context, child, progress) =>
                progress == null ? child : Center(child: CircularProgressIndicator()),
            errorBuilder: (context, error, stackTrace) =>
                Center(child: Icon(Icons.error, color: Colors.red)),
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              'Restaurante Don Sini',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
