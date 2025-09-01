import 'package:flutter/material.dart';

// ============================
// MODELO ItemModel
// ============================
class ItemModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String sectionId;

  ItemModel({
    required this.id,
    required this.name,
    this.description = "",
    this.price = 0.0,
    required this.sectionId,
  });

  ItemModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? sectionId,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      sectionId: sectionId ?? this.sectionId,
    );
  }
}

// ============================
// MODELO SEÇÃO
// ============================
class SecaoModel {
  final String id;
  final String title;
  final String restaurantId;
  final List<ItemModel> itens;

  SecaoModel({
    required this.id,
    required this.title,
    required this.restaurantId,
    this.itens = const [],
  });

  SecaoModel copyWith({
    String? id,
    String? title,
    String? restaurantId,
    List<ItemModel>? itens,
  }) {
    return SecaoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      restaurantId: restaurantId ?? this.restaurantId,
      itens: itens ?? this.itens,
    );
  }
}

// ============================
// MODELO RestauranteModel
// ============================
class RestauranteModel {
  final String id;
  final String ownerId;
  final int layout;
  final String name;
  final String email;
  final String primaryColor;
  final String secondaryColor;
  final String password;
  final List<SecaoModel> secoes;

  RestauranteModel({
    required this.id,
    required this.ownerId,
    this.layout = 0,
    required this.name,
    this.email = "",
    this.primaryColor = "000000",
    this.secondaryColor = "000000",
    this.password = "",
    this.secoes = const [],
  });

  RestauranteModel copyWith({
    String? id,
    String? ownerId,
    int? layout,
    String? name,
    String? email,
    String? primaryColor,
    String? secondaryColor,
    String? password,
    List<SecaoModel>? secoes,
  }) {
    return RestauranteModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      layout: layout ?? this.layout,
      name: name ?? this.name,
      email: email ?? this.email,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      password: password ?? this.password,
      secoes: secoes ?? this.secoes,
    );
  }
}
