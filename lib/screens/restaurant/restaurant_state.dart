import 'package:equatable/equatable.dart';
import 'models.dart';

abstract class RestaurantState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<RestauranteModel> restaurantes;

  RestaurantLoaded(this.restaurantes);

  @override
  List<Object?> get props => [restaurantes];
}

class RestaurantError extends RestaurantState {
  final String message;

  RestaurantError(this.message);

  @override
  List<Object?> get props => [message];
}
