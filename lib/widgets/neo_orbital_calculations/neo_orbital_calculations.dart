import 'dart:math' as math;
import 'package:flutter/material.dart';

// Function to calculate the NEO's position based on orbital parameters
Offset calculateNEOPosition(double semiMajorAxis, double eccentricity, double trueAnomaly, double inclination, double ascendingNode, double perihelionArgument) {
  // Convert angles to radians
  double iRad = inclination * (math.pi / 180);
  double nodeRad = ascendingNode * (math.pi / 180);
  double periRad = perihelionArgument * (math.pi / 180);
  double anomalyRad = trueAnomaly * (math.pi / 180);

  // Calculate distance from the center (focus of ellipse)
  double r = semiMajorAxis * (1 - eccentricity * eccentricity) / (1 + eccentricity * math.cos(anomalyRad));

  // Position in the plane of the orbit
  double x = r * math.cos(anomalyRad);
  double y = r * math.sin(anomalyRad);

  // Apply rotations to account for orbital inclination and ascending node
  double xPrime = x * (math.cos(periRad) * math.cos(nodeRad) - math.sin(periRad) * math.sin(nodeRad) * math.cos(iRad)) -
                  y * (math.sin(periRad) * math.cos(nodeRad) + math.cos(periRad) * math.sin(nodeRad) * math.cos(iRad));
                  
  double yPrime = x * (math.cos(periRad) * math.sin(nodeRad) + math.sin(periRad) * math.cos(nodeRad) * math.cos(iRad)) -
                  y * (math.sin(periRad) * math.sin(nodeRad) - math.cos(periRad) * math.cos(nodeRad) * math.cos(iRad));
  
  // Return the position (Offset) that we will use for UI
  return Offset(xPrime, yPrime);
}
