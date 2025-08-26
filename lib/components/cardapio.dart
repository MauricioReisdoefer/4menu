import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cardapio extends StatefulWidget {
  final String urlImg;

  const Cardapio({super.key, required this.urlImg});
  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  Widget _buildLogo(urlImg) {
    return Image.asset(urlImg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Center(child: _buildLogo('images/4chefs.png')),
      ),
    );
  }
}
