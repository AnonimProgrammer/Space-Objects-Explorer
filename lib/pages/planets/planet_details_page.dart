import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../helper_components/space_grading.dart';
import '../../helper_components/space_grading_type.dart';
import '../../models/planet_model.dart';
import '../../storage/favorites_storage.dart';

class PlanetDetailsPage extends StatefulWidget {
  final Planet planet;
  const PlanetDetailsPage({super.key, required this.planet});

  @override
  State<PlanetDetailsPage> createState() => _PlanetDetailsPageState();
}

class _PlanetDetailsPageState extends State<PlanetDetailsPage> {

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    FavoritesStorage.isFavoritePlanet(widget.planet.name).then((fav) {
      setState(() => isFavorite = fav);
    });
  }

  void toggleFavorite() async {
    if (isFavorite) {
      await FavoritesStorage.removeFavoritePlanet(widget.planet.name);
    } else {
      await FavoritesStorage.saveFavoritePlanet(widget.planet);
    }

    final favorite = await FavoritesStorage.isFavoritePlanet(widget.planet.name);
    setState(() => isFavorite = favorite);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          favorite ? 'Planet added to favorites!' : 'Planet removed from favorites.',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        decoration: BoxDecoration(
          gradient: SpaceGrading((SpaceGradingType.red)),
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
                    'PLANET DETAILS',
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
                    'assets/images/planets.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 40),
                decoration: BoxDecoration(
                  color: Colors.black26.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${widget.planet.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Gravity: ${widget.planet.gravity} m/s²',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Mass: ${widget.planet.massValue} * 10${widget.planet.toSuperscript(widget.planet.massExponent)} kg',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      color: Colors.redAccent.withOpacity(0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discovered By: ${widget.planet.discoveredBy}",
                            style: const TextStyle(
                              color: Color(0xffd5d5d5),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            "Discovery Date: ${widget.planet.discoveryDate}",
                            style: const TextStyle(
                              color: Color(0xffd5d5d5),
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Density: ${widget.planet.density} kg/m³',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Mean Radius: ${widget.planet.meanRadius} km',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Moons Count: ${widget.planet.moonsCount}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Sideral Orbit: ${widget.planet.sideralOrbit} days',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Sideral Rotation: ${widget.planet.sideralRotation} hours',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
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
