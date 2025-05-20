import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/models/asteroid_model.dart';
import 'package:space_objects_explorer_app/pages/asteroids/asteroid_details_page.dart';
import 'package:space_objects_explorer_app/storage/favorites_storage.dart';

class FavoriteAsteroidsPage extends StatefulWidget {
  const FavoriteAsteroidsPage({super.key});

  @override
  _FavoriteAsteroidsPageState createState() => _FavoriteAsteroidsPageState();
}

class _FavoriteAsteroidsPageState extends State<FavoriteAsteroidsPage> {
  List<Asteroid> favoriteAsteroids = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final asteroids = await FavoritesStorage.getFavoriteAsteroids();
    setState(() {
      favoriteAsteroids = asteroids;
    });
  }

  void _toggleFavorite(Asteroid asteroid) async {
    await FavoritesStorage.removeFavoriteAsteroid(asteroid.id);
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
    if (favoriteAsteroids.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Favorite Asteroids')),
        body: const Center(child: Text('No favorite asteroids yet.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Asteroids')),
      body: ListView.builder(
        itemCount: favoriteAsteroids.length,
        itemBuilder: (context, index) {
          final asteroid = favoriteAsteroids[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(asteroid.name),
              subtitle: Text('Name: ${asteroid.name} - Id: ${asteroid.id}'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () => _toggleFavorite(asteroid),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AsteroidDetailsPage(asteroid: asteroid)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
