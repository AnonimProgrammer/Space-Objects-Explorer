import 'package:flutter/material.dart';

class PreviewPageButton extends StatelessWidget {
  const PreviewPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF22223D),
            Color(0xFF4A4E69),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: const Text('START EXPLORING',
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 1,
            fontWeight: FontWeight.w800,
            color: Color(0xFFE5E5E5),
          ),
        ),
      ),
    );
  }
}