class Asteroid {
  final String id;
  final String name;
  final bool isPotentiallyHazardous;
  final double absoluteMagnitudeH;
  final double estimatedDiameterMinInMeters;
  final double estimatedDiameterMaxInMeters;
  final String closeApproachDate;
  final String missDistanceInKilometers;
  final String relativeVelocityInKilometersPerHour;
  final String nasaJPLUrl;

  Asteroid({
    required this.id,
    required this.name,
    required this.isPotentiallyHazardous,
    required this.absoluteMagnitudeH,
    required this.estimatedDiameterMinInMeters,
    required this.estimatedDiameterMaxInMeters,
    required this.closeApproachDate,
    required this.missDistanceInKilometers,
    required this.relativeVelocityInKilometersPerHour,
    required this.nasaJPLUrl,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    return Asteroid(
      id: json['id'],
      name: json['name'],
      isPotentiallyHazardous: json['is_potentially_hazardous_asteroid'],
      absoluteMagnitudeH: json['absolute_magnitude_h'].toDouble(),
      estimatedDiameterMinInMeters: json['estimated_diameter']['meters']['estimated_diameter_min'].toDouble(),
      estimatedDiameterMaxInMeters: json['estimated_diameter']['meters']['estimated_diameter_max'].toDouble(),
      closeApproachDate: json['close_approach_data'][0]['close_approach_date'],
      missDistanceInKilometers: json['close_approach_data'][0]['miss_distance']['kilometers'],
      relativeVelocityInKilometersPerHour: json['close_approach_data'][0]['relative_velocity']['kilometers_per_hour'],
      nasaJPLUrl: json['nasa_jpl_url'],
    );
  }
}