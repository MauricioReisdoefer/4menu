import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/layouts/cardapio_layout_2.dart';
import 'package:newproject/components/restaurantes.dart';
import 'package:newproject/models/produto_model.dart';
import 'restaurant_bloc.dart';
import 'restaurant_event.dart';
import 'restaurant_state.dart';
import 'api_service.dart';
import 'models.dart';

class Restaurantes extends StatefulWidget {
  @override
  State<Restaurantes> createState() => _RestaurantesState();
}

class _RestaurantesState extends State<Restaurantes> {
  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

  void _mudarCorPrimaria(Color color) => setState(() => corPrimaria = color);
  void _mudarCorSecundaria(Color color) => setState(() => corSecundaria = color);

  void _abrirColorPicker(bool isPrimaria) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isPrimaria ? "Escolha a Cor Primária" : "Escolha a Cor Secundária"),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: isPrimaria ? corPrimaria : corSecundaria,
            onColorChanged: (color) {
              if (isPrimaria) _mudarCorPrimaria(color);
              else _mudarCorSecundaria(color);
            },
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK")),
        ],
      ),
    );
  }

  Future<CardapioLayout2> _montarCardapio(RestauranteModel rest) async {
    final secoes = await ApiService.getSecoes(rest.id);
    final categorias = <String, List<Produto>>{};

    for (final secao in secoes) {
      final itens = await ApiService.getItens(secao.id);
      categorias[secao.title] = itens
          .map((i) => Produto(
                nome: i.name,
                descricao: i.description,
                preco: i.price,
                foto: 'assets/images/background.jpeg',
              ))
          .toList();
    }

    return CardapioLayout2(
      urlImg: 'assets/images/4menu.png',
      urlBanner: 'assets/images/4menu.png',
      nomeRestaurante: rest.name,
      categorias: categorias,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantBloc()..add(FetchRestaurants()),
      child: DefaultTabController(
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
              // Aba Restaurantes (BLoC)
              BlocBuilder<RestaurantBloc, RestaurantState>(
                builder: (context, state) {
                  if (state is RestaurantLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RestaurantError) {
                    return Center(
                      child: Text(state.message, style: const TextStyle(color: Colors.white)),
                    );
                  } else if (state is RestaurantLoaded) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: state.restaurantes.map((rest) {
                          return GestureDetector(
                            onTap: () async {
                              final cardapio = await _montarCardapio(rest);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => cardapio),
                              );
                            },
                            child: Restaurante(
                              url: "https://picsum.photos/200",
                              nome: rest.name,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),

              // Aba Meus Restaurantes
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.restaurant_menu, color: Colors.white, size: 100),
                    SizedBox(height: 30),
                    Text(
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
      ),
    );
  }
}
