import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_objects_explorer_app/models/asteroid_model.dart';
import '../../helper_components/space_grading.dart';
import '../../helper_components/space_grading_type.dart';
import '../../storage/favorites_storage.dart';

class AsteroidDetailsPage extends StatefulWidget {
  final Asteroid asteroid;
  const AsteroidDetailsPage({super.key, required this.asteroid});

  @override
  State<AsteroidDetailsPage> createState() => _AsteroidDetailsPageState();
}

class _AsteroidDetailsPageState extends State<AsteroidDetailsPage> {

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    FavoritesStorage.isFavoriteAsteroid(widget.asteroid.id).then((fav) {
      setState(() => isFavorite = fav);
    });
  }

  void toggleFavorite() async {
    if (isFavorite) {
      await FavoritesStorage.removeFavoriteAsteroid(widget.asteroid.id);
    } else {
      await FavoritesStorage.saveFavoriteAsteroid(widget.asteroid);
    }

    final favorite = await FavoritesStorage.isFavoriteAsteroid(widget.asteroid.id);
    setState(() => isFavorite = favorite);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          favorite ? 'Added to favorites!' : 'Removed from favorites.',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isPotentiallyHazardous = widget.asteroid.isPotentiallyHazardous;
    final Color potentiallyHazardousColor = isPotentiallyHazardous ? Colors.redAccent : Colors.green;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        decoration: BoxDecoration(
          gradient: SpaceGrading((SpaceGradingType.green)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ASTEROID DETAILS',
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 35,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.redAccent : Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      toggleFavorite();
                    },
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(
                    'assets/images/asteroids.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(left: 10, right:10, top: 10, bottom: 40),
                decoration: BoxDecoration(
                  color: Colors.black26.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${widget.asteroid.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Asteroid ID: ${widget.asteroid.id}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      color: potentiallyHazardousColor.withOpacity(0.1),
                      width: double.infinity,
                      height: 35,
                      child: Text(
                        'Potentially hazardous: ${isPotentiallyHazardous ? "Yes" : "No"}',
                        style: TextStyle(
                          color: potentiallyHazardousColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Estimated Diameter Min: ${widget.asteroid.estimatedDiameterMinInMeters} m',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Estimated Diameter Max: ${widget.asteroid.estimatedDiameterMaxInMeters} m',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Miss Distance: ${widget.asteroid.missDistanceInKilometers} km',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Relative Velocity: ${widget.asteroid.relativeVelocityInKilometersPerHour} km/h',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Close Approach Date: ${widget.asteroid.closeApproachDate}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.blueAccent.withOpacity(0.1),
                      width: double.infinity,
                      child: Text(
                        "NASA Source: ${widget.asteroid.nasaJPLUrl}",
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
