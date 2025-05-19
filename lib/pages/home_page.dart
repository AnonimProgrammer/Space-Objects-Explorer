import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading_type.dart';
import 'package:space_objects_explorer_app/widgets/space_object_category_card.dart';

import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> _spaceObjectCategories = [
    'Planets',
    'Asteroids',
    'Satellites',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true, // allows the AppBar to float over body
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'HOME PAGE',
          style: GoogleFonts.bebasNeue(
            color: Colors.white,
            fontSize: 26,
            letterSpacing: 3,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          gradient: SpaceGrading(SpaceGradingType.light),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight + 100),
            Text(
              'SPACE OBJECTS',
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: 35,
                letterSpacing: 5,
                fontWeight: FontWeight.w900,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _spaceObjectCategories.length,
                itemBuilder: (context, index) {
                  return SpaceObjectCategoryCard(
                    categoryName: _spaceObjectCategories[index].toLowerCase(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
