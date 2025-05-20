import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/pages/satellites/satellite_details_page.dart';

import '../../models/satellite_model.dart';
import '../../storage/favorites_storage.dart';


class FavoriteSatellitesPage extends StatefulWidget {
  const FavoriteSatellitesPage({super.key});

  @override
  _FavoriteSatellitesPageState createState() => _FavoriteSatellitesPageState();
}

class _FavoriteSatellitesPageState extends State<FavoriteSatellitesPage> {
  List<Satellite> favoriteSatellites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final sats = await FavoritesStorage.getFavoriteSatellites();
    setState(() {
      favoriteSatellites = sats;
    });
  }

  void _toggleFavorite(Satellite sat) async {
    await FavoritesStorage.removeFavoriteSatellite(sat.id);
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
    if (favoriteSatellites.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Favorite Satellites')),
        body: const Center(child: Text('No favorite satellites yet.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Satellites')),
      body: ListView.builder(
        itemCount: favoriteSatellites.length,
        itemBuilder: (context, index) {
          final sat = favoriteSatellites[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(sat.name),
              subtitle: Text('ID: ${sat.id} - Launch: ${sat.launchDate}'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () => _toggleFavorite(sat),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SatelliteDetailsPage(satellite: sat,)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
