import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:newproject/components/footer.dart';
import 'package:newproject/screens/create_restaurant/form/restaurant_form.dart';
import 'package:newproject/screens/create_restaurant/sections/cardaprio_form.dart';
import 'form/form_bloc.dart';
import 'sections/cardapio_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models.dart';

class CriacaoRestauranteScreen extends StatefulWidget {
  const CriacaoRestauranteScreen({Key? key}) : super(key: key);

  @override
  State<CriacaoRestauranteScreen> createState() => _CriacaoRestauranteScreenState();
}

class _CriacaoRestauranteScreenState extends State<CriacaoRestauranteScreen> {
  String nomeRestaurante = "";
  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

  // Pega o ownerId via JWT
  Future<String?> getOwnerId() async {
    final prefs = await SharedPreferences.getInstance();
    final jwtToken = prefs.getString('jwt_token');
    if (jwtToken == null) return null;

    final url = Uri.parse('http://192.168.1.12:5000/users/viewme');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $jwtToken'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['id'].toString();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(create: (_) => RestaurantBloc()),
        BlocProvider<CardapioBloc>(create: (_) => CardapioBloc()),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFF1F1E1E),
        appBar: AppBar(
          toolbarHeight: 120,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 31, 30, 30),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: Image.asset('assets/images/4menu.png', height: 150),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestauranteForm(),
              const SizedBox(height: 30),
              const CardapioForm(),
              const SizedBox(height: 40),
              Builder(
                builder: (context) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        final restaurantBloc = context.read<RestaurantBloc>();
                        final cardapioBloc = context.read<CardapioBloc>();

                        final restaurantState = restaurantBloc.state;
                        final cardapioState = cardapioBloc.state;

                        final ownerId = await getOwnerId();
                        if (ownerId == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Não foi possível pegar o ownerId.")),
                          );
                          return;
                        }

                        final secoes = cardapioState.secoes.map((secao) {
                          final itens = secao.itens.map((item) {
                            return ItemModel(
                              id: item.id.toString(),
                              name: item.nome,
                              description: item.descricao,
                              price: double.tryParse(item.preco) ?? 0.0,
                              sectionId: secao.id.toString(),
                            );
                          }).toList();

                          return SecaoModel(
                            id: secao.id.toString(),
                            title: secao.titulo,
                            restaurantId: "",
                            itens: itens,
                          );
                        }).toList();

                        final novoRestaurante = RestauranteModel(
                          id: UniqueKey().toString(),
                          ownerId: ownerId,
                          layout: 0,
                          name: restaurantState.nome ?? nomeRestaurante,
                          primaryColor: corPrimaria.value.toRadixString(16),
                          secondaryColor: corSecundaria.value.toRadixString(16),
                          secoes: secoes,
                        );

                        print("Restaurante cadastrado: $novoRestaurante");

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text("Restaurante cadastrado com sucesso!")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        "Finalizar",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: RodapeRestaurante(abaAtual: 'criar'),
      ),
    );
  }
}
