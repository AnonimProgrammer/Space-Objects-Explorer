import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:space_objects_explorer_app/models/satellite_model.dart';

class SatelliteService {
  static const BASE_URL = 'https://api.n2yo.com/rest/v1/satellite/above/0/0/0/180/0';
  final String apiKey;

  SatelliteService(this.apiKey);

  Future<List<Satellite>> getSatellitesData() async {
    final response = await http.get(
      Uri.parse('$BASE_URL?apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['above']
          .map<Satellite>((json) => Satellite.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load satellite data!");
    }
  }

}
