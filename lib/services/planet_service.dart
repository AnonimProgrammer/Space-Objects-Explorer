import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/planet_model.dart';

class PlanetService {
  static const BASE_URL = 'https://api.le-systeme-solaire.net/rest/bodies/';

  Future<List<Planet>> getPlanetsData() async {
    final response = await http.get(
      Uri.parse(BASE_URL),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['bodies']
          .map<Planet>((json) => Planet.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load planet data!");
    }
  }
}