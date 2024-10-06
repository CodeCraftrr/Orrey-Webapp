class NEO {
  final double semiMajorAxis;
  final double eccentricity;
  final double inclination;
  final double ascendingNode;
  final double perihelionArgument;
  final double trueAnomaly; // Add true anomaly

  NEO({
    required this.semiMajorAxis,
    required this.eccentricity,
    required this.inclination,
    required this.ascendingNode,
    required this.perihelionArgument,
    required this.trueAnomaly, // Required parameter for position calculation
  });

  // Function to deserialize from JSON
  factory NEO.fromJson(Map<String, dynamic> json) {
    return NEO(
      semiMajorAxis: json['semiMajorAxis'] as double,
      eccentricity: json['eccentricity'] as double,
      inclination: json['inclination'] as double,
      ascendingNode: json['ascendingNode'] as double,
      perihelionArgument: json['perihelionArgument'] as double,
      trueAnomaly: json['trueAnomaly'] as double, // Ensure this is coming from API
    );
  }
}
