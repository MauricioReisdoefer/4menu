import 'package:flutter/material.dart';

abstract class RestaurantEvent {}

class RestaurantNomeChanged extends RestaurantEvent {
  final String nome;
  RestaurantNomeChanged(this.nome);
}

class RestaurantCorPrimariaChanged extends RestaurantEvent {
  final Color cor;
  RestaurantCorPrimariaChanged(this.cor);
}

class RestaurantCorSecundariaChanged extends RestaurantEvent {
  final Color cor;
  RestaurantCorSecundariaChanged(this.cor);
}

class RestaurantSubmitted extends RestaurantEvent {
  final String email;
  final String password;
  RestaurantSubmitted({required this.email, required this.password});
}
