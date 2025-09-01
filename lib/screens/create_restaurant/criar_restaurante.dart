import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/components/footer.dart';
import 'package:newproject/components/restaurantes.dart';
import 'package:newproject/screens/create_restaurant/form/restaurant_form.dart';
import 'package:newproject/screens/create_restaurant/sections/cardaprio_form.dart';
import 'form/form_bloc.dart';

// ==========================
// TELA PRINCIPAL
// ==========================
class CriacaoRestauranteScreen extends StatefulWidget {
  const CriacaoRestauranteScreen({Key? key}) : super(key: key);

  @override
  State<CriacaoRestauranteScreen> createState() => _CriacaoRestauranteScreenState();
}

class _CriacaoRestauranteScreenState extends State<CriacaoRestauranteScreen> {
  String nomeRestaurante = "";
  Color corPrimaria = Colors.orange;
  Color corSecundaria = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestaurantBloc(),
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
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Restaurante novoRestaurante = Restaurante(
                      url: "sdfsdf",
                      nome: nomeRestaurante,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "Finalizar",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: RodapeRestaurante(abaAtual: 'criar'),
      ),
    );
  }
}
