import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/asteroid_model.dart';

class AsteroidService {
  static const BASE_URL = 'https://api.nasa.gov/neo/rest/v1/feed';
  final String apiKey;

  AsteroidService(this.apiKey);

  Future<List<Asteroid>> getAsteroidsData(String todayDate) async {
    final response = await http.get(
      Uri.parse('$BASE_URL?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['near_earth_objects'][todayDate]
          .map<Asteroid>((json) => Asteroid.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load asteroid data!");
    }
  }


  String getTodayDateFormatted() {
    final DateTime now = DateTime.now();
    final String formattedDate =
        '${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }

}
