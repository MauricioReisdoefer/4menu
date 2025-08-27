import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'register_event.dart';
import 'register_state.dart';

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
      final url = Uri.parse("http://10.0.29.229:5000/users/create"); 

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
