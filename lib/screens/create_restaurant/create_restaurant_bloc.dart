import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_restaurant_event.dart';
import 'create_restaurant_state.dart';
import 'package:flutter/material.dart';

class CriacaoRestauranteBloc
    extends Bloc<CriacaoRestauranteEvent, CriacaoRestauranteState> {
  CriacaoRestauranteBloc() : super(CriacaoRestauranteState()) {
    on<NomeMudou>((event, emit) {
      emit(state.copyWith(nome: event.nome));
    });

    on<CorPrimariaMudou>((event, emit) {
      emit(state.copyWith(corPrimaria: event.cor));
    });

    on<CorSecundariaMudou>((event, emit) {
      emit(state.copyWith(corSecundaria: event.cor));
    });

    on<SecaoAdicionada>((event, emit) {
      final novaSecao = SecaoState(id: UniqueKey(), titulo: event.titulo);
      emit(state.copyWith(secoes: [...state.secoes, novaSecao]));
    });

    on<SecaoRemovida>((event, emit) {
      emit(state.copyWith(
          secoes: state.secoes.where((s) => s.id != event.id).toList()));
    });

    on<ItemAdicionado>((event, emit) {
      final secoesAtualizadas = state.secoes.map((secao) {
        if (secao.id == event.secaoId) {
          final novoItem = ItemState(
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

    on<ItemRemovido>((event, emit) {
      final secoesAtualizadas = state.secoes.map((secao) {
        if (secao.id == event.secaoId) {
          final itensAtualizados =
              secao.itens.where((i) => i.id != event.itemId).toList();
          return secao.copyWith(itens: itensAtualizados);
        }
        return secao;
      }).toList();

      emit(state.copyWith(secoes: secoesAtualizadas));
    });

    on<SubmeterRestaurante>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, erro: null));

      try {
        // Aqui futuramente você chamará o backend
        await Future.delayed(const Duration(seconds: 1));

        emit(state.copyWith(isSubmitting: false));
      } catch (e) {
        emit(state.copyWith(isSubmitting: false, erro: e.toString()));
      }
    });
  }
}
