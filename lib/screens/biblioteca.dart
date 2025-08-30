import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/restaurantes.dart';
import 'package:newproject/components/layouts/cardapio.dart';
import 'package:newproject/screens/criar_restaurante.dart';
import 'package:newproject/screens/inicio.dart';
import 'package:newproject/screens/register/resgister.dart';

class Biblioteca extends StatefulWidget {
  @override
  State<Biblioteca> createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

  void _mudarCorPrimaria(Color color) {
    setState(() {
      corPrimaria = color;
    });
  }

  void _mudarCorSecundaria(Color color) {
    setState(() {
      corSecundaria = color;
    });
  }

  void _abrirColorPicker(bool isPrimaria) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            isPrimaria ? "Escolha a Cor Primária" : "Escolha a Cor Secundária",
          ),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: isPrimaria ? corPrimaria : corSecundaria,
              onColorChanged: (color) {
                if (isPrimaria) {
                  _mudarCorPrimaria(color);
                } else {
                  _mudarCorSecundaria(color);
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 120,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 30, 30),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Image.asset('assets/images/4menu.png', height: 150),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cardapio(
                      urlImg: 'assets/images/4menu.png', // logo
                      urlBanner: 'assets/images/4menu.png', // banner
                      nomeRestaurante: 'Meu Tico', // nome restaurante
                      categorias: {
                        // categorias: bebidas, hamburguers, pizzas...
                        // junto com os produtos e seus precos, descrições e fotos
                        'Entradas': [
                          Produto(
                            nome: 'Salada Tropical', // nome
                            descricao: 'Mix de folhas e frutas', // descrição
                            preco: 15.9, // preco
                            foto:
                                'assets/images/background.jpeg', // foto produto
                          ),
                        ],
                        'Pratos Principais': [
                          Produto(
                            nome: 'Frango Grelhado',
                            descricao: 'Frango suculento',
                            preco: 29.9,
                            foto: 'assets/images/background.jpeg',
                          ),
                        ],
                        'Bebidas': [
                          Produto(
                            nome: 'Suco Natural',
                            descricao: 'Suco de laranja fresquinho',
                            preco: 7.50,
                            foto: 'assets/images/background.jpeg',
                          ),
                          Produto(
                            nome: 'Refrigerante',
                            descricao: 'Coca-Cola lata 350ml',
                            preco: 6.00,
                            foto: 'assets/images/background.jpeg',
                          ),
                        ],
                        'Sobremesas': [
                          Produto(
                            nome: 'Petit Gateau',
                            descricao:
                                'Bolo com recheio de chocolate e sorvete',
                            preco: 18.90,
                            foto: 'assets/images/background.jpeg',
                          ),
                        ],
                      },
                    ),
                  ), // tua tela de cardápio
                );
              },
              child: Restaurante(
                url:
                    'https://i0.wp.com/corujamusic.com.br/wp-content/uploads/2022/11/queen-made-in-heaven.jpg?ssl=1',
                nome: 'Meu tico',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RodapeRestaurante(abaAtual: 'biblioteca'),
    );
  }
}
