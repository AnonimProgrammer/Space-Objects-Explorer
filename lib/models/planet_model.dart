class Planet {
  final String name;
  final double gravity;
  final double massValue;
  final int massExponent;
  final String discoveredBy;
  final String discoveryDate;
  final double density;
  final double meanRadius;
  final int moonsCount;
  final double sideralOrbit;
  final double sideralRotation;

  Planet({
    required this.name,
    required this.gravity,
    required this.massValue,
    required this.massExponent,
    required this.discoveredBy,
    required this.discoveryDate,
    required this.density,
    required this.meanRadius,
    required this.moonsCount,
    required this.sideralOrbit,
    required this.sideralRotation,
  });
  factory Planet.fromJson(Map<String, dynamic> json) {
    final mass = json['mass'];

    return Planet(
      name: json['englishName'],
      gravity: (json['gravity'] ?? 0).toDouble(),
      massValue: mass != null ? (mass['massValue'] ?? 0).toDouble() : 0.0,
      massExponent: mass != null ? (mass['massExponent'] ?? 0).toInt() : 0,
      discoveredBy: json['discoveredBy'] ?? 'Unknown',
      discoveryDate: json['discoveryDate'] ?? 'Unknown',
      density: (json['density'] ?? 0).toDouble(),
      meanRadius: (json['meanRadius'] ?? 0).toDouble(),
      moonsCount: json['moons'] != null ? json['moons'].length : 0,
      sideralOrbit: (json['sideralOrbit'] ?? 0).toDouble(),
      sideralRotation: (json['sideralRotation'] ?? 0).toDouble(),
    );
  }
  String toSuperscript(int exponent) {
    const superscripts = {
      '0': '⁰',
      '1': '¹',
      '2': '²',
      '3': '³',
      '4': '⁴',
      '5': '⁵',
      '6': '⁶',
      '7': '⁷',
      '8': '⁸',
      '9': '⁹',
      '-': '⁻',
    };

    return exponent.toString().split('').map((c) => superscripts[c] ?? '').join();
  }

}