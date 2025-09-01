import 'package:flutter/material.dart';

class CardapioItem {
  final Key id;
  final String nome;
  final String descricao;
  final String preco;

  CardapioItem({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
  });
}

class CardapioSecao {
  final Key id;
  final String titulo;
  final List<CardapioItem> itens;

  CardapioSecao({
    required this.id,
    required this.titulo,
    required this.itens,
  });

  CardapioSecao copyWith({String? titulo, List<CardapioItem>? itens}) {
    return CardapioSecao(
      id: id,
      titulo: titulo ?? this.titulo,
      itens: itens ?? this.itens,
    );
  }
}

class CardapioState {
  final List<CardapioSecao> secoes;

  CardapioState({required this.secoes});

  CardapioState copyWith({List<CardapioSecao>? secoes}) {
    return CardapioState(secoes: secoes ?? this.secoes);
  }

  factory CardapioState.initial() => CardapioState(secoes: []);
}
