import 'package:flutter_bloc/flutter_bloc.dart';
import 'restaurant_event.dart';
import 'restaurant_state.dart';
import 'api_service.dart';
import 'package:flutter/material.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<FetchRestaurants>((event, emit) async {
      emit(RestaurantLoading());
      try {
        final restaurantes = await ApiService.getRestaurantes();
        debugPrint("----");
        debugPrint("${restaurantes}");
        debugPrint("----");
        if (restaurantes.isEmpty) {
          emit(RestaurantError("Nenhum restaurante encontrado"));
        } else {
          emit(RestaurantLoaded(restaurantes));
        }
      } catch (e) {
        emit(RestaurantError(e.toString()));
      }
    });
  }
}
