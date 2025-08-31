import 'package:flutter/material.dart';

abstract class CriacaoRestauranteEvent {}

class NomeMudou extends CriacaoRestauranteEvent {
  final String nome;
  NomeMudou(this.nome);
}

class CorPrimariaMudou extends CriacaoRestauranteEvent {
  final Color cor;
  CorPrimariaMudou(this.cor);
}

class CorSecundariaMudou extends CriacaoRestauranteEvent {
  final Color cor;
  CorSecundariaMudou(this.cor);
}

class SecaoAdicionada extends CriacaoRestauranteEvent {
  final String titulo;
  SecaoAdicionada(this.titulo);
}

class SecaoRemovida extends CriacaoRestauranteEvent {
  final Key id;
  SecaoRemovida(this.id);
}

class ItemAdicionado extends CriacaoRestauranteEvent {
  final Key secaoId;
  final String nome;
  final String descricao;
  final double preco;

  ItemAdicionado({
    required this.secaoId,
    required this.nome,
    required this.descricao,
    required this.preco,
  });
}

class ItemRemovido extends CriacaoRestauranteEvent {
  final Key secaoId;
  final Key itemId;

  ItemRemovido({required this.secaoId, required this.itemId});
}

class SubmeterRestaurante extends CriacaoRestauranteEvent {}
