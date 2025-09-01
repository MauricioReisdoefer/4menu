import 'package:flutter_bloc/flutter_bloc.dart';
import 'cardapio_event.dart';
import 'cardapio_state.dart';
import 'package:flutter/material.dart';

class CardapioBloc extends Bloc<CardapioEvent, CardapioState> {
  CardapioBloc() : super(CardapioState.initial()) {
    on<AdicionarSecao>((event, emit) {
      final novaSecao = CardapioSecao(
        id: UniqueKey(),
        titulo: event.titulo,
        itens: [],
      );
      emit(state.copyWith(secoes: [...state.secoes, novaSecao]));
    });

    on<RemoverSecao>((event, emit) {
      emit(state.copyWith(secoes: state.secoes.where((s) => s.id != event.id).toList()));
    });

    on<AdicionarItem>((event, emit) {
      final secoesAtualizadas = state.secoes.map((secao) {
        if (secao.id == event.secaoId) {
          final novoItem = CardapioItem(
            id: UniqueKey(),
            nome: event.nome,
            descricao: event.descricao,
            preco: event.preco,
          );
          return secao.copyWith(itens: [...secao.itens, novoItem]);
        }
        return secao;
      }).toList();

      emit(state.copyWith(secoes: secoesAtualizadas));
    });

    on<RemoverItem>((event, emit) {
      final secoesAtualizadas = state.secoes.map((secao) {
        if (secao.id == event.secaoId) {
          final itensAtualizados = secao.itens.where((i) => i.id != event.itemId).toList();
          return secao.copyWith(itens: itensAtualizados);
        }
        return secao;
      }).toList();

      emit(state.copyWith(secoes: secoesAtualizadas));
    });
  }
}
