import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading_type.dart';
import 'package:space_objects_explorer_app/services/asteroid_service.dart';
import 'package:space_objects_explorer_app/widgets/asteroid_card.dart';

import '../../helper_components/space_grading.dart';
import '../../models/asteroid_model.dart';

class AsteroidsListPage extends StatefulWidget {
  const AsteroidsListPage({super.key});

  @override
  State<AsteroidsListPage> createState() => _AsteroidsListPageState();
}

class _AsteroidsListPageState extends State<AsteroidsListPage> {

  final AsteroidService asteroidService = AsteroidService('D8jHooSCZEPSd1Nt6KaDqUB7pephg9H8N1BU1zYY');
  List<Asteroid>? asteroids;

  Future<void> _getAsteroids() async {
    String todayDate = asteroidService.getTodayDateFormatted();
    try {
      final data = await asteroidService.getAsteroidsData(todayDate);
      setState(() {
        asteroids = data;
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    _getAsteroids();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: SpaceGrading((SpaceGradingType.green)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'ASTEROIDS',
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 35,
                letterSpacing: 4,
                fontWeight: FontWeight.w900,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: asteroids == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : ListView.builder(
                        itemCount: asteroids!.length,
                        itemBuilder: (context, index) {
                          final asteroid = asteroids![index];
                          return AsteroidCard(asteroid: asteroid);
                        },
                      ),
              ),
            ],
          ),
        )
    );
  }
}
