import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart'; // onde ficaram os models acima
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String baseUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';

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
  final url = "$baseUrl/secao/get/$restId";
  debugPrint("Chamando URL de seções: $url");

  final res = await http.get(Uri.parse(url));

  debugPrint("Status code: ${res.statusCode}");
  debugPrint("Body raw: ${res.body}");

  if (res.statusCode == 200) {
    try {
      final body = jsonDecode(res.body);
      debugPrint("Body decodificado: $body");

      if (body is List) {
        debugPrint("Body é uma lista com ${body.length} elementos");
        return body.map((e) => SecaoModel.fromJson(e)).toList();
      } else if (body is Map<String, dynamic>) {
        debugPrint("Body é um Map<String, dynamic>, verificando chave 'secoes'");
        if (body.containsKey('secoes') && body['secoes'] is List) {
          debugPrint("Body['secoes'] tem ${body['secoes'].length} elementos");
          return (body['secoes'] as List)
              .map((e) => SecaoModel.fromJson(e))
              .toList();
        } else {
          debugPrint("Map não contém a chave 'secoes' ou não é uma lista");
          return [];
        }
      } else {
        debugPrint("Body não é lista nem Map, retornando vazio");
        return [];
      }
    } catch (e) {
      debugPrint("Erro ao decodificar JSON: $e");
      return [];
    }
  } else {
    debugPrint("Erro HTTP: ${res.statusCode}");
    throw Exception("Erro ao buscar seções");
  }
}


  static Future<List<ItemModel>> getItens(int secaoId) async {
  String apiUrl = dotenv.env['API_URL'] ?? 'http://localhost:3000';
  final url = Uri.parse('${apiUrl}/item/get/$secaoId');
  debugPrint("Chamando URL de itens: $url");

  try {
    final response = await http.get(url);
    debugPrint("Status code itens: ${response.statusCode}");
    debugPrint("Body raw itens: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("Erro ao buscar itens, status: ${response.statusCode}");
    }

    final bodyDecoded = json.decode(response.body);
    debugPrint("Body decodificado itens: $bodyDecoded");

    if (bodyDecoded is List) {
      debugPrint("Body é uma lista com ${bodyDecoded.length} elementos");
      List<ItemModel> itens = bodyDecoded.map<ItemModel>((item) {
        debugPrint("Convertendo item: $item");
        return ItemModel.fromJson(item);
      }).toList();
      debugPrint("Itens montados: $itens");
      return itens;
    } else {
      throw Exception("Body não é uma lista");
    }
  } catch (e, s) {
    debugPrint("Erro no getItens: $e");
    debugPrint("Stacktrace: $s");
    throw Exception("Erro ao buscar itens");
  }
}
}
