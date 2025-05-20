import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/models/planet_model.dart';
import 'package:space_objects_explorer_app/pages/planets/planet_details_page.dart';
import 'package:space_objects_explorer_app/storage/favorites_storage.dart';

class FavoritePlanetsPage extends StatefulWidget {
  const FavoritePlanetsPage({super.key});

  @override
  _FavoritePlanetsPageState createState() => _FavoritePlanetsPageState();
}

class _FavoritePlanetsPageState extends State<FavoritePlanetsPage> {
  List<Planet> favoritePlanets = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final planets = await FavoritesStorage.getFavoritePlanets();
    setState(() {
      favoritePlanets = planets;
    });
  }

  void _toggleFavorite(Planet planet) async {
    await FavoritesStorage.removeFavoritePlanet(planet.name);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Removed from favorites.'),
        duration: const Duration(seconds: 1),
      ),
    );
    _loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    if (favoritePlanets.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Favorite Planets')),
        body: const Center(child: Text('No favorite planets yet.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Planets')),
      body: ListView.builder(
        itemCount: favoritePlanets.length,
        itemBuilder: (context, index) {
          final planet = favoritePlanets[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(planet.name),
              subtitle: Text('Name: ${planet.name} - Gravity: ${planet.gravity} m/s²'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () => _toggleFavorite(planet),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlanetDetailsPage(planet: planet)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
