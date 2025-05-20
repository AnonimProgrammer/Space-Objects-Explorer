import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/helper_components/space_grading_type.dart';

class SpaceGrading extends LinearGradient {
  final SpaceGradingType type;

  SpaceGrading(this.type)
      : super(
    colors: _gradients[type] ?? _gradients[SpaceGradingType.dark]!,
    stops: [0.0, 0.1, 0.3, 0.5, 0.7, 1.0],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const Map<SpaceGradingType, List<Color>> _gradients = {
    SpaceGradingType.light: [
      Color(0xFFFAB46E),
      Color(0xFFEE7E2A),
      Color(0xFFB2501B),
      Color(0xFF413072),
      Color(0xFF292160),
      Color(0xFF1D1E2A),
    ],
    SpaceGradingType.medium: [
      Color(0xFFFCAE60),
      Color(0xFFDE7627),
      Color(0xFF8F4015),
      Color(0xFF24245D),
      Color(0xFF1A1A4B),
      Color(0xFF181A23),
    ],
    SpaceGradingType.dark: [
      Color(0xFFFFA447),
      Color(0xFFCC6D24),
      Color(0xFF773512),
      Color(0xFF24245D),
      Color(0xFF121234),
      Color(0xFF0B0C10),
    ],
    SpaceGradingType.purple: [
      Color(0xFF754683),
      Color(0xFF741079),
      Color(0xFF5D0D60),
      Color(0xFF24245D),
      Color(0xFF1A1A4B),
      Color(0xFF181A23),
    ],
    SpaceGradingType.red: [
      Color(0xFFFF5E5E),
      Color(0xFFE63946),
      Color(0xFF9B1D20),
      Color(0xFF3E1F47),
      Color(0xFF1A1A3C),
      Color(0xFF0F0F1C),
    ],
    SpaceGradingType.green: [
      Color(0xFF81C784),
      Color(0xFF4CAF50),
      Color(0xFF2E7D32),
      Color(0xFF342170),
      Color(0xFF292160),
      Color(0xFF1D1E2A),
    ],
  };
}
