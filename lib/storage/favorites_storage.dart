import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/asteroid_model.dart';
import '../models/planet_model.dart';
import '../models/satellite_model.dart';

class FavoritesStorage {
  static const String satellitesKey = 'favorite_satellites';
  static const String planetsKey = 'favorite_planets';
  static const String asteroidsKey = 'favorite_asteroids';

  // Satellite
  static Future<void> saveFavoriteSatellite(Satellite satellite) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favList = prefs.getStringList(satellitesKey) ?? [];
    if (!favList.any((item) => jsonDecode(item)['satid'] == satellite.id)) {
      favList.add(jsonEncode({
        'satid': satellite.id,
        'satname': satellite.name,
        'intDesignator': satellite.intDesignator,
        'launchDate': satellite.launchDate,
        'satlat': satellite.satLat,
        'satlng': satellite.satLng,
        'satalt': satellite.satAlt,
      }));
      await prefs.setStringList(satellitesKey, favList);
    }
  }


  static Future<void> removeFavoriteSatellite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(satellitesKey) ?? [];
    favList.removeWhere((item) => jsonDecode(item)['satid'] == id);
    await prefs.setStringList(satellitesKey, favList);
  }

  static Future<List<Satellite>> getFavoriteSatellites() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(satellitesKey) ?? [];
    return favList.map((e) => Satellite.fromJson(jsonDecode(e))).toList();
  }
  static Future<void> clearFavoriteSatellites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(satellitesKey);
  }

  static Future<bool> isFavoriteSatellite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(satellitesKey) ?? [];
    return favList.any((item) => jsonDecode(item)['satid'] == id);
  }

  // Planet
  static Future<void> saveFavoritePlanet(Planet planet) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favList = prefs.getStringList(planetsKey) ?? [];
    if (!favList.any((item) => jsonDecode(item)['englishName'] == planet.name)) {
      favList.add(jsonEncode({
        'englishName': planet.name,
        'gravity': planet.gravity,
        'massValue': planet.massValue,
        'massExponent': planet.massExponent,
        'discoveredBy': planet.discoveredBy,
        'discoveryDate': planet.discoveryDate,
        'density': planet.density,
        'meanRadius': planet.meanRadius,
        'moonsCount': planet.moonsCount,
        'sideralOrbit': planet.sideralOrbit,
        'sideralRotation': planet.sideralRotation,
      }));
      await prefs.setStringList(planetsKey, favList);
    }
  }

  static Future<void> removeFavoritePlanet(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(planetsKey) ?? [];
    favList.removeWhere((item) => jsonDecode(item)['englishName'] == name);
    await prefs.setStringList(planetsKey, favList);
  }

  static Future<List<Planet>> getFavoritePlanets() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(planetsKey) ?? [];
    return favList.map((e) => Planet.fromJson(jsonDecode(e))).toList();
  }

  static Future<bool> isFavoritePlanet(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(planetsKey) ?? [];
    return favList.any((item) => jsonDecode(item)['englishName'] == name);
  }

  // Asteroid
  static Future<void> saveFavoriteAsteroid(Asteroid asteroid) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favList = prefs.getStringList(asteroidsKey) ?? [];
    if (!favList.any((item) => jsonDecode(item)['id'] == asteroid.id)) {
      favList.add(jsonEncode({
        'id': asteroid.id,
        'name': asteroid.name,
        'is_potentially_hazardous_asteroid': asteroid.isPotentiallyHazardous,
        'absolute_magnitude_h': asteroid.absoluteMagnitudeH,
        'estimated_diameter': {
          'meters': {
            'estimated_diameter_min': asteroid.estimatedDiameterMinInMeters,
            'estimated_diameter_max': asteroid.estimatedDiameterMaxInMeters,
          }
        },
        'close_approach_data': [
          {
            'close_approach_date': asteroid.closeApproachDate,
            'miss_distance': {'kilometers': asteroid.missDistanceInKilometers},
            'relative_velocity': {'kilometers_per_hour': asteroid.relativeVelocityInKilometersPerHour},
          }
        ],
        'nasa_jpl_url': asteroid.nasaJPLUrl,
      }));
      await prefs.setStringList(asteroidsKey, favList);
    }
  }

  static Future<void> removeFavoriteAsteroid(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(asteroidsKey) ?? [];
    favList.removeWhere((item) => jsonDecode(item)['id'] == id);
    await prefs.setStringList(asteroidsKey, favList);
  }

  static Future<List<Asteroid>> getFavoriteAsteroids() async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(asteroidsKey) ?? [];
    return favList.map((e) => Asteroid.fromJson(jsonDecode(e))).toList();
  }

  static Future<bool> isFavoriteAsteroid(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final favList = prefs.getStringList(asteroidsKey) ?? [];
    return favList.any((item) => jsonDecode(item)['id'] == id);
  }
}
