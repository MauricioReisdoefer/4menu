import 'package:flutter_bloc/flutter_bloc.dart';
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
      throw UnimplementedError("TO-DO: Conectar com a request");
      // 
      // TO-DO: Conectar com a request
      //
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: "Erro no login: $e",
      ));
    }
  }
}
