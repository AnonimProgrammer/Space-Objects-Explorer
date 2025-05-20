import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading_type.dart';

import '../widgets/preview_page_button.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: SpaceGrading(SpaceGradingType.dark),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                'EXPLORE SOLAR SYSTEM',
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFE5E5E5),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Let\'s see what in Space',
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 1,
                  color: Color(0xFFE5E5E5),
                ),
              ),
              const SizedBox(height: 70),
              PreviewPageButton(),
            ],
          ),
        ),
      ),
    );
  }
}
