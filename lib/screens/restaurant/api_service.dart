import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart'; // onde ficaram os models acima
import 'package:flutter/material.dart';

class ApiService {
  static const baseUrl = "http://10.0.29.229:5000";

  static Future<List<RestauranteModel>> getRestaurantes() async {
  final res = await http.get(Uri.parse("$baseUrl/restaurants/1"));
  debugPrint("---");
  debugPrint("${res.statusCode}");
  debugPrint("${jsonDecode(res.body)}");
  debugPrint("---");
  if (res.statusCode == 200) {
    final body = jsonDecode(res.body);

    if (body is List) {
      return body.map((e) => RestauranteModel.fromJson(e)).toList();
    } else if (body is Map<String, dynamic>) {
      return [RestauranteModel.fromJson(body)];
    } else {
      return [];
    }
  } else {
    throw Exception("Erro ao buscar restaurantes");
  }
}


  static Future<List<SecaoModel>> getSecoes(int restId) async {
    final res = await http.get(Uri.parse("$baseUrl/secoes/$restId"));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => SecaoModel.fromJson(e)).toList();
    } else {
      throw Exception("Erro ao buscar seções");
    }
  }

  static Future<List<ItemModel>> getItens(int secaoId) async {
    final res = await http.get(Uri.parse("$baseUrl/itens/$secaoId"));
    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => ItemModel.fromJson(e)).toList();
    } else {
      throw Exception("Erro ao buscar itens");
    }
  }
}
