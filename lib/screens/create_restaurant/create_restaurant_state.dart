import 'package:flutter/material.dart';

class SecaoState {
  final Key id;
  final String titulo;
  final List<ItemState> itens;

  SecaoState({required this.id, required this.titulo, this.itens = const []});

  SecaoState copyWith({String? titulo, List<ItemState>? itens}) {
    return SecaoState(
      id: id,
      titulo: titulo ?? this.titulo,
      itens: itens ?? this.itens,
    );
  }
}

class ItemState {
  final Key id;
  final String nome;
  final String descricao;
  final double preco;

  ItemState({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
  });
}

class CriacaoRestauranteState {
  final String nome;
  final Color corPrimaria;
  final Color corSecundaria;
  final List<SecaoState> secoes;
  final bool isSubmitting;
  final String? erro;

  CriacaoRestauranteState({
    this.nome = "",
    this.corPrimaria = Colors.orange,
    this.corSecundaria = Colors.grey,
    this.secoes = const [],
    this.isSubmitting = false,
    this.erro,
  });

  CriacaoRestauranteState copyWith({
    String? nome,
    Color? corPrimaria,
    Color? corSecundaria,
    List<SecaoState>? secoes,
    bool? isSubmitting,
    String? erro,
  }) {
    return CriacaoRestauranteState(
      nome: nome ?? this.nome,
      corPrimaria: corPrimaria ?? this.corPrimaria,
      corSecundaria: corSecundaria ?? this.corSecundaria,
      secoes: secoes ?? this.secoes,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      erro: erro,
    );
  }
}
