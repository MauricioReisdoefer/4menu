import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';
      final url = Uri.parse("${apiUrl}/users/login");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": event.username,
          "password": event.password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data["access_token"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', token);

        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          token: token,
          errorMessage: null,
        ));
      } else {
        final data = jsonDecode(response.body);
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: data["error"] ?? "PORRA, deu erro ma n tem nada ai",
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
