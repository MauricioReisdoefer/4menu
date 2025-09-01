import 'package:flutter/material.dart';

class RestaurantState {
  final String nome;
  final Color corPrimaria;
  final Color corSecundaria;
  final bool loading;
  final String? error;
  final bool success;

  RestaurantState({
    required this.nome,
    required this.corPrimaria,
    required this.corSecundaria,
    this.loading = false,
    this.error,
    this.success = false,
  });

  RestaurantState copyWith({
    String? nome,
    Color? corPrimaria,
    Color? corSecundaria,
    bool? loading,
    String? error,
    bool? success,
  }) {
    return RestaurantState(
      nome: nome ?? this.nome,
      corPrimaria: corPrimaria ?? this.corPrimaria,
      corSecundaria: corSecundaria ?? this.corSecundaria,
      loading: loading ?? this.loading,
      error: error,
      success: success ?? this.success,
    );
  }

  factory RestaurantState.initial() {
    return RestaurantState(
      nome: "",
      corPrimaria: Colors.orange,
      corSecundaria: Colors.grey,
    );
  }
}
