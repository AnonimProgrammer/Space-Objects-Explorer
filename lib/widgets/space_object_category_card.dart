import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpaceObjectCategoryCard extends StatelessWidget {
  final String categoryName;
  const SpaceObjectCategoryCard({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/$categoryName');
          },
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Image.asset(
                      'assets/images/${categoryName.toLowerCase()}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    categoryName,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
