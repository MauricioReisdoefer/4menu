import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/restaurantes.dart';
import 'package:newproject/components/cardapio.dart';
import 'package:newproject/screens/criar_restaurante.dart';
import 'package:newproject/screens/inicio.dart';
import 'package:newproject/screens/register/resgister.dart';

class Restaurantes extends StatefulWidget {
  @override
  State<Restaurantes> createState() => _RestaurantesState();
}

class _RestaurantesState extends State<Restaurantes> {
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

  // Função para criar o Cardapio com exemplo de produtos
  Cardapio criarCardapioExemplo(String nomeRestaurante) {
    return Cardapio(
      urlImg: 'assets/images/4menu.png',
      urlBanner: 'assets/images/4menu.png',
      nomeRestaurante: nomeRestaurante,
      categorias: {
        'Entradas': [
          Produto(
            nome: 'Salada Tropical',
            descricao: 'Mix de folhas e frutas',
            preco: 15.9,
            foto: 'assets/images/background.jpeg',
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
            descricao: 'Bolo com recheio de chocolate e sorvete',
            preco: 18.90,
            foto: 'assets/images/background.jpeg',
          ),
        ],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 31, 30, 30),
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Image.asset('assets/images/4menu.png', height: 150),
          bottom: TabBar(
            indicatorColor: corPrimaria,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(text: 'Restaurantes'),
              Tab(text: 'Meus Restaurantes'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cada restaurante envolvido em GestureDetector
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              criarCardapioExemplo('Meu Tico'),
                        ),
                      );
                    },
                    child: Restaurante(
                      url:
                          'https://i0.wp.com/corujamusic.com.br/wp-content/uploads/2022/11/queen-made-in-heaven.jpg?ssl=1',
                      nome: 'Meu Tico',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              criarCardapioExemplo('Restaurante XYZ'),
                        ),
                      );
                    },
                    child: Restaurante(
                      url:
                          'https://i0.wp.com/corujamusic.com.br/wp-content/uploads/2022/11/queen-made-in-heaven.jpg?ssl=1',
                      nome: 'Restaurante XYZ',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              criarCardapioExemplo('Restaurante ABC'),
                        ),
                      );
                    },
                    child: Restaurante(
                      url:
                          'https://i0.wp.com/corujamusic.com.br/wp-content/uploads/2022/11/queen-made-in-heaven.jpg?ssl=1',
                      nome: 'Restaurante ABC',
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_menu, color: Colors.white, size: 100),
                  const SizedBox(height: 30),
                  const Text(
                    'Você ainda não tem nenhum restaurante',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: RodapeRestaurante(abaAtual: 'restaurantes'),
      ),
    );
  }
}
