import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final String? token;

  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.token
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? token
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      token: token ?? this.token
    );
  }

  @override
  List<Object?> get props => [isLoading, isSuccess, errorMessage];
}
