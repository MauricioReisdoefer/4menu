import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String urlImg;
  const LogoWidget({super.key, required this.urlImg});

  @override
  Widget build(BuildContext context) {
    return Image.asset(urlImg, height: 120, fit: BoxFit.contain);
  }
}

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
