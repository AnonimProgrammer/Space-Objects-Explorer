import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading.dart';
import 'package:space_objects_explorer_app/pages/favorites/favorite_satellites_page.dart';
import 'package:space_objects_explorer_app/pages/favorites/favorite_planets_page.dart';
import 'package:space_objects_explorer_app/pages/favorites/favorite_asteroids_page.dart';

import '../helper_components/space_grading_type.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: SpaceGrading(SpaceGradingType.red),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Explore Favorites',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 27
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.satellite,color: Colors.white,),
              title: const Text(
                  'Favorite Satellites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const FavoriteSatellitesPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.public, color: Colors.white,),
              title: const Text(
                  'Favorite Planets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const FavoritePlanetsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.brightness_low, color: Colors.white,),
              title: const Text(
                  'Favorite Asteroids',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const FavoriteAsteroidsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
