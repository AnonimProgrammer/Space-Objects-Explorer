import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/pages/asteroids/asteroid_details_page.dart';
import '../models/asteroid_model.dart';

class AsteroidCard extends StatelessWidget {
  final Asteroid asteroid;
  const AsteroidCard({super.key, required this.asteroid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AsteroidDetailsPage(asteroid: asteroid)),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 120,
            width: MediaQuery.of(context).size.width * 0.65,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                asteroid.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Asteroid ID: ${asteroid.id}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Hazardous: ${asteroid.isPotentiallyHazardous ? "Yes" : "No"}',
                  style: TextStyle(
                    color: asteroid.isPotentiallyHazardous ? Colors.redAccent : Colors.green,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 40),
        Text('•', style: TextStyle(fontSize: 80, color: Colors.black38)),
      ],
    );
  }
}
