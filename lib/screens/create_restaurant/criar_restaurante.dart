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
  State<CriacaoRestauranteScreen> createState() =>
      _CriacaoRestauranteScreenState();
}

class _CriacaoRestauranteScreenState extends State<CriacaoRestauranteScreen> {
  // Pega o ownerId via JWT
  Future<String?> getOwnerId() async {
    final prefs = await SharedPreferences.getInstance();
    final jwtToken = prefs.getString('jwt_token');
    if (jwtToken == null) return null;

    final url = Uri.parse('http://10.0.29.229:5000/users/viewme');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $jwtToken'},
    );
    debugPrint("----------------");
    debugPrint("----------------");
    debugPrint("----------------");
    debugPrint("Response: ${response.body}");
    debugPrint("----------------");
    debugPrint("----------------");
    debugPrint("----------------");
    if (true) {
      final data = jsonDecode(response.body);
      return data['id'].toString();
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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
