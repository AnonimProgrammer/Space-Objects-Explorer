import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_objects_explorer_app/models/satellite_model.dart';
import '../../helper_components/space_grading.dart';
import '../../helper_components/space_grading_type.dart';
import '../../storage/favorites_storage.dart';

class SatelliteDetailsPage extends StatefulWidget {
  final Satellite satellite;
  const SatelliteDetailsPage({super.key, required this.satellite});

  @override
  State<SatelliteDetailsPage> createState() => _SatelliteDetailsPageState();
}

class _SatelliteDetailsPageState extends State<SatelliteDetailsPage> {

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    FavoritesStorage.isFavoriteSatellite(widget.satellite.id).then((fav) {
      setState(() => isFavorite = fav);
    });
  }

  void toggleFavorite() async {
    if (isFavorite) {
      await FavoritesStorage.removeFavoriteSatellite(widget.satellite.id);
    } else {
      await FavoritesStorage.saveFavoriteSatellite(widget.satellite);
    }

    final favorite = await FavoritesStorage.isFavoriteSatellite(widget.satellite.id);
    setState(() => isFavorite = favorite);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          favorite ? 'Satellite added to favorites!' : 'Satellite removed from favorites.',
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
          gradient: SpaceGrading((SpaceGradingType.purple)),
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
                    'SATELLITE DETAILS',
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
                    'assets/images/satellites.png',
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
                      'Name: ${widget.satellite.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Satellite ID: ${widget.satellite.id}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Launch Date: ${widget.satellite.launchDate}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "International Designator: ${widget.satellite.intDesignator}",
                      style: const TextStyle(
                        color: Color(0xffd5d5d5),
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: double.infinity,
                        color: Colors.green.withOpacity(0.2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Satellite Latitude:  ${widget.satellite.satLat}°",
                              style: const TextStyle(
                                color: Color(0xffd5d5d5),
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "Satellite Longitude:  ${widget.satellite.satLng}°",
                              style: const TextStyle(
                                color: Color(0xffd5d5d5),
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              "Satellite Altitude:  ${widget.satellite.satAlt} km",
                              style: const TextStyle(
                                color: Color(0xffd5d5d5),
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        )
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
