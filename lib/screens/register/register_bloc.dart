import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'register_event.dart';
import 'register_state.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(errorMessage: "As senhas não coincidem"));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';
      final url = Uri.parse("${apiUrl}/users/create"); 

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": event.name,
          "email": event.email,
          "password": event.password,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);

        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
        ));
      } else {
        final data = jsonDecode(response.body);
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: data["error"] ?? "Erro inesperado",
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: "Falha na conexão com o servidor: $e",
      ));
    }
  }
}
