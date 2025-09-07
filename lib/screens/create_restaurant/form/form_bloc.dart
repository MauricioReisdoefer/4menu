import 'package:flutter_bloc/flutter_bloc.dart';
import 'form_event.dart';
import 'form_state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantState.initial()) {
    on<RestaurantNomeChanged>((event, emit) {
      emit(state.copyWith(nome: event.nome));
    });

    on<RestaurantCorPrimariaChanged>((event, emit) {
      emit(state.copyWith(corPrimaria: event.cor));
    });

    on<RestaurantCorSecundariaChanged>((event, emit) {
      emit(state.copyWith(corSecundaria: event.cor));
    });

    on<RestaurantSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
      RestaurantSubmitted event, Emitter<RestaurantState> emit) async {
    emit(state.copyWith(loading: true, error: null, success: false));

    try {
      // TODO: pegar token do SharedPreferences
      final token = "JWT_AQUI";

      String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';
      final response = await http.post(
        Uri.parse("${apiUrl}/restaurants/create"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "name": state.nome,
          "email": event.email,
          "password": event.password,
          "primary_color": state.corPrimaria.value.toRadixString(16).padLeft(8, '0'),
          "secondary_color": state.corSecundaria.value.toRadixString(16).padLeft(8, '0'),
        }),
      );

      if (response.statusCode == 200) {
        emit(state.copyWith(loading: false, success: true));
      } else {
        emit(state.copyWith(
          loading: false,
          error: "Erro ao criar restaurante: ${response.body}",
        ));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
