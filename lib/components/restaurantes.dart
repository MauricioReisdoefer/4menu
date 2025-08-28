import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newproject/screens/cozinha.dart';

class Restaurante extends StatefulWidget {
  final String url;
  final String nome;
  final Function(bool favorito)? onFavoritar; //❗ avisa o pai

  const Restaurante({
    super.key,
    required this.url,
    required this.nome,
    this.onFavoritar,
  });

  @override
  State<Restaurante> createState() => _RestauranteState();
}

class _RestauranteState extends State<Restaurante> {
  bool _favorito = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.network(
              widget.url,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
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
                widget.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: Material(
                color: Colors.black.withOpacity(0.35),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    setState(() {
                      _favorito = !_favorito;
                    });
                    if (widget.onFavoritar != null) {
                      widget.onFavoritar!(_favorito); //❗ avisa o pai
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      _favorito ? Icons.favorite : Icons.favorite_border,
                      color: _favorito ? Colors.redAccent : Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),

            // cozinheiro
            Positioned(
              bottom: 8,
              right: 8,
              child: Material(
                color: Colors.black.withOpacity(0.35),
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cozinha(
                            pedidos: [
                              Pedido(
                                id: 101,
                                produtos: [
                                  Produto(
                                    nome: "Hambúrguer Clássico",
                                    foto: "assets/images/background.jpeg",
                                  ),
                                  Produto(
                                    nome: "Batata Frita",
                                    foto: "assets/images/background.jpeg",
                                  ),
                                  Produto(
                                    nome: "Coca-Cola Lata",
                                    foto: "assets/images/background.jpeg",
                                  ),
                                ],
                              ),
                              Pedido(
                                id: 102,
                                produtos: [
                                  Produto(
                                    nome: "Pizza Calabresa",
                                    foto: "assets/images/background.jpeg",
                                  ),
                                  Produto(
                                    nome: "Suco de Laranja",
                                    foto: "assets/images/background.jpeg",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FaIcon(
                      FontAwesomeIcons.utensils,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
