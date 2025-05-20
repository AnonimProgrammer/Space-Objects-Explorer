import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading_type.dart';
import 'package:space_objects_explorer_app/models/satellite_model.dart';
import 'package:space_objects_explorer_app/services/satellite_service.dart';
import 'package:space_objects_explorer_app/widgets/satellite_card.dart';
import '../../helper_components/space_grading.dart';

class SatellitesListPage extends StatefulWidget {
  const SatellitesListPage({super.key});

  @override
  State<SatellitesListPage> createState() => _SatellitesListPageState();
}

class _SatellitesListPageState extends State<SatellitesListPage> {

  final SatelliteService satelliteService = SatelliteService('LMUEBY-UZGJM9-VNLC94-5H9G');
  List<Satellite>? satellites;

  Future<void> _getSatellites() async {
    try {
      final data = await satelliteService.getSatellitesData();
      setState(() {
        satellites = data;
      });
    } catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    _getSatellites();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: SpaceGrading((SpaceGradingType.purple)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'SATELLITES',
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
                child: satellites == null
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : ListView.builder(
                  itemCount: satellites!.length,
                  itemBuilder: (context, index) {
                    final satellite = satellites![index];
                    return SatelliteCard(satellite: satellite);
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
