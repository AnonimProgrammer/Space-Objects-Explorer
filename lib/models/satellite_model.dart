class Satellite {
  final int id;
  final String name;
  final String intDesignator;
  final String launchDate;
  final double satLat;
  final double satLng;
  final double satAlt;

  Satellite({
    required this.id,
    required this.name,
    required this.intDesignator,
    required this.launchDate,
    required this.satLat,
    required this.satLng,
    required this.satAlt,
  });

  factory Satellite.fromJson(Map<String, dynamic> json) {
    return Satellite(
      id: json['satid'].toInt(),
      name: json['satname'],
      intDesignator: json['intDesignator'],
      launchDate: json['launchDate'],
      satLat: json['satlat'].toDouble(),
      satLng: json['satlng'].toDouble(),
      satAlt: json['satalt'].toDouble(),
    );
  }
}