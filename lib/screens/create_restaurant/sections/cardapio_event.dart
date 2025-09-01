import 'package:flutter/material.dart';

abstract class CardapioEvent {}

class AdicionarSecao extends CardapioEvent {
  final String titulo;
  AdicionarSecao(this.titulo);
}

class RemoverSecao extends CardapioEvent {
  final Key id;
  RemoverSecao(this.id);
}

class AdicionarItem extends CardapioEvent {
  final Key secaoId;
  final String nome;
  final String descricao;
  final String preco;

  AdicionarItem({
    required this.secaoId,
    required this.nome,
    required this.descricao,
    required this.preco,
  });
}

class RemoverItem extends CardapioEvent {
  final Key secaoId;
  final Key itemId;

  RemoverItem({required this.secaoId, required this.itemId});
}
