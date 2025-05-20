import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading_type.dart';
import 'package:space_objects_explorer_app/widgets/planet_card.dart';

import '../../helper_components/space_grading.dart';
import '../../models/planet_model.dart';
import '../../services/planet_service.dart';

class PlanetsListPage extends StatefulWidget {
  const PlanetsListPage({super.key});

  @override
  State<PlanetsListPage> createState() => _PlanetsListPageState();
}

class _PlanetsListPageState extends State<PlanetsListPage> {

  final PlanetService planetService = PlanetService();
  List<Planet>? planets;

  Future<void> _getPlanets() async {
    try {
      final data = await planetService.getPlanetsData();
      setState(() {
        planets = data;
      });
    } catch (exception) {
      print(exception);
    }
  }


  @override
  void initState() {
    super.initState();
    _getPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: SpaceGrading((SpaceGradingType.red)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              'PLANETS',
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
                child: planets == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                    )
                    : ListView.builder(
                  itemCount: planets!.length,
                  itemBuilder: (context, index) {
                    final planet = planets![index];
                    return PlanetCard(
                      planet: planet,
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
