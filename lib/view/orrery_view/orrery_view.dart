import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:orrey_web_app/widgets/navigation%20bar/navigation_bar.dart';
import 'package:http/http.dart' as http;

// NEO Model and Data Fetching Function
class NEO {
  final String name;
  final double distanceAU;
  final double velocityKmPerSec;
  final double estimatedDiameterMin;
  final double estimatedDiameterMax;
  final bool isPotentiallyHazardous;

  NEO({
    required this.name,
    required this.distanceAU,
    required this.velocityKmPerSec,
    required this.estimatedDiameterMin,
    required this.estimatedDiameterMax,
    required this.isPotentiallyHazardous,
  });

  // Updated factory constructor to parse the new API structure
  factory NEO.fromJson(Map<String, dynamic> json) {
    final closeApproachData = json['close_approach_data'][0];
    return NEO(
      name: json['name'],
      distanceAU:
          double.parse(closeApproachData['miss_distance']['astronomical']),
      velocityKmPerSec: double.parse(
          closeApproachData['relative_velocity']['kilometers_per_second']),
      estimatedDiameterMin: json['estimated_diameter']['kilometers']
          ['estimated_diameter_min'],
      estimatedDiameterMax: json['estimated_diameter']['kilometers']
          ['estimated_diameter_max'],
      isPotentiallyHazardous: json['is_potentially_hazardous_asteroid'],
    );
  }
}

class Planet {
  final String name;
  final String size;
  final String position;
  final String lightSource;
  bool isHovered; // New property to track hover state

  Planet({
    required this.name,
    required this.size,
    required this.position,
    required this.lightSource,
    this.isHovered = false, // Default value for hover state
  });
}

Future<List<NEO>> fetchNEOData() async {
  const url =
      'http://localhost:4008/api/fetch-neos'; // Make sure your API URL is correct
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
  });

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((item) => NEO.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load NEO data');
  }
}

class OrreryView extends StatefulWidget {
  const OrreryView({super.key});

  @override
  _OrreryViewState createState() => _OrreryViewState();
}

class _OrreryViewState extends State<OrreryView> with TickerProviderStateMixin {
  late AnimationController _mercuryController;
  late AnimationController _venusController;
  late AnimationController _earthController;
  late AnimationController _marsController;
  late AnimationController _jupiterController;
  late AnimationController _saturnController;
  late AnimationController _uranusController;
  late AnimationController _neptuneController;

  late Future<List<NEO>> _neoDataFuture;
  NEO? _selectedNEO; // Variable to hold the selected NEO

  final List<Planet> planets = [
    Planet(
      name: 'Sun',
      size:
          'Size: The sun is about 109 times wider than Earth and makes up 99.86% of the solar system’s total mass, making it the largest object by far.',
      position:
          'Position: Located at the center of the solar system, all planets, moons, and other objects orbit around the sun due to its strong gravitational pull.',
      lightSource:
          'Light Source: The sun emits energy as light and heat through nuclear fusion, powering life on Earth and driving the entire solar system’s climate and weather patterns.',
    ),
    Planet(
      name: 'Mercury',
      size:
          'Size: Mercury is the smallest planet, about 38% the size of Earth.',
      position:
          'Position: Closest planet to the sun, orbiting at an average distance of 57.9 million km.',
      lightSource:
          'Light Source: Receives intense sunlight, with no atmosphere to protect it, causing extreme temperature fluctuations.',
    ),
    Planet(
      name: 'Venus',
      size: 'Size: Similar to Earth, about 95% of Earth’s size.',
      position: 'Position: Second planet from the sun, 108.2 million km away.',
      lightSource:
          'Light Source: Thick atmosphere reflects most sunlight, making it the brightest planet in the night sky.',
    ),
    Planet(
      name: 'Earth',
      size: 'Size: Earth\'s diameter is about 12,742 km.',
      position:
          'Position: Third planet from the sun, located 149.6 million km away.',
      lightSource:
          'Light Source: The sun\'s light supports all life and drives Earth\'s climate.',
    ),
    Planet(
      name: 'Mars',
      size: 'Size: About half the size of Earth.',
      position: 'Position: Fourth planet, 227.9 million km from the sun.',
      lightSource:
          'Light Source: Receives less sunlight, contributing to its cold desert-like environment.',
    ),
    Planet(
      name: 'Jupiter',
      size: 'Size: The largest planet, 11 times wider than Earth.',
      position:
          'Position: Fifth planet from the sun, orbiting at 778.5 million km.',
      lightSource:
          'Light Source: Reflects sunlight strongly, especially its clouds and moons, though its atmosphere absorbs much light.',
    ),
    Planet(
      name: 'Saturn',
      size: 'Size: About 9.5 times Earth\'s size.',
      position: 'Position: Sixth planet, located 1.4 billion km from the sun.',
      lightSource:
          'Light Source: Its rings reflect sunlight, making it visually striking in the solar system.',
    ),
    Planet(
      name: 'Uranus',
      size: 'Size: 4 times the size of Earth.',
      position: 'Position: Seventh planet, 2.9 billion km from the sun.',
      lightSource:
          'Light Source: Receives faint sunlight, appearing as a pale blue planet due to its methane-rich atmosphere.',
    ),
    Planet(
      name: 'Neptune',
      size:
          'Size: Slightly smaller than Uranus, about 3.9 times the size of Earth.',
      position:
          'Position: Eighth and farthest planet, 4.5 billion km from the sun.',
      lightSource:
          'Light Source: Receives the least sunlight, making it the coldest planet.',
    ),
  ];

  final TransformationController _transformationController =
      TransformationController();

  get onPressed => null;

  @override
  void initState() {
    super.initState();

    _mercuryController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _venusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat();

    _earthController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _marsController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();

    _jupiterController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _saturnController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 25),
    )..repeat();

    _uranusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    _neptuneController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 35),
    )..repeat();

    _neoDataFuture = fetchNEOData();
  }

  @override
  void dispose() {
    _mercuryController.dispose();
    _venusController.dispose();
    _earthController.dispose();
    _marsController.dispose();
    _jupiterController.dispose();
    _saturnController.dispose();
    _uranusController.dispose();
    _neptuneController.dispose();
    super.dispose();
  }

  void _showPlanetInfo(Planet planet) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black87, // Background color of the dialog
          title: Text(
            planet.name,
            style: TextStyle(
              color: Colors.yellowAccent, // Title color
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planet.size,
                style: TextStyle(color: Colors.white), // Text color for size
              ),
              SizedBox(height: 8),
              Text(
                planet.position,
                style:
                    TextStyle(color: Colors.white), // Text color for position
              ),
              SizedBox(height: 8),
              Text(
                planet.lightSource,
                style: TextStyle(
                    color: Colors.white), // Text color for light source
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style:
                    TextStyle(color: Colors.yellowAccent), // Close button color
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15.0), // Rounded corners for the dialog
          ),
        );
      },
    );
  }

  Widget _buildPlanetButtons() {
    return Positioned(
      right: 30,
      top: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end, // Align buttons to the end
        children: planets.map((planet) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 4.0), // Add vertical spacing
            child: MouseRegion(
              onEnter: (_) => _hoverPlanet(planet, true),
              onExit: (_) => _hoverPlanet(planet, false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: planet.isHovered
                      ? Colors.lightGreen
                      : Colors.green, // Change color on hover
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  boxShadow: planet.isHovered
                      ? [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Position of shadow
                          ),
                        ]
                      : null,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _showPlanetInfo(planet);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Colors.transparent, // Make background transparent
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0), // Horizontal padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30.0), // Rounded corners
                    ),
                  ),
                  child: Text(planet.name),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

// Method to manage hover state
  void _hoverPlanet(Planet planet, bool isHovered) {
    setState(() {
      planet.isHovered =
          isHovered; // Assuming `isHovered` is a property in your Planet class
    });
  }

  // Dropdown widget
  Widget _buildDropdown(List<NEO> neos) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black54, // Background color for dropdown
        borderRadius: BorderRadius.circular(30.0), // Rounded corners
      ),
      child: DropdownButton<NEO>(
        value: _selectedNEO,
        hint: const Text(
          'Select NEO',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        onChanged: (NEO? newValue) {
          setState(() {
            _selectedNEO = newValue;
          });
        },
        items: [
          DropdownMenuItem<NEO>(
            enabled: false, // Disable interaction for the title
            child: Container(
              padding: const EdgeInsets.all(8.0), // Add some padding
              child: const Text(
                'NEOs List: ',
                style: TextStyle(
                  color: Colors
                      .white, // Make the title color white for better contrast
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ...neos.map((NEO neo) {
            return DropdownMenuItem<NEO>(
              value: neo,
              child: Row(
                children: [
                  // Add the marker icon based on hazardous status
                  Icon(
                    Icons.adjust,
                    color:
                        neo.isPotentiallyHazardous ? Colors.red : Colors.yellow,
                  ),
                  const SizedBox(width: 8), // Space between icon and text
                  Text(
                    neo.name,
                    style: const TextStyle(
                        color: Colors.white), // Make the item text white
                  ),
                ],
              ),
            );
          }).toList(),
        ],
        dropdownColor: Colors.black87, // Background color of dropdown menu
        style: const TextStyle(
            color: Colors.white), // Style for selected item text
        underline: Container(), // Remove the underline for a cleaner look
      ),
    );
  }

  // Planet? _selectedPlanet; // Variable to hold the selected planet details

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: InteractiveViewer(
              transformationController: _transformationController,
              minScale: 0.5,
              maxScale: 10,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Move the Sun's GestureDetector to the top of the stack
                    GestureDetector(
                      onTap: () {
                        print('Sun clicked');
                        _showPlanetInfo(planets[0]); // Show Sun's info
                      },
                      child: Container(
                        width: 120, // Ensure this matches the Sun's image size
                        height: 120, // Ensure this matches the Sun's image size
                        color: Colors
                            .transparent, // Add a transparent color to ensure it's clickable
                        child: Image.asset('assets/sun.gif',
                            width: 120, height: 120),
                      ),
                    ),

                    _buildOrbits(),
                    _buildAsteroidBelt(),
                    _buildSecondAsteroidBelt(),

                    // Planet Orbits
                    _buildPlanetOrbit(
                      'assets/planets/mercury.png',
                      _mercuryController,
                      orbitRadius: 50,
                      planetSize: const Size(8, 8),
                      planet: planets[1],
                      selfRotationDuration:
                          Duration(seconds: 2), // Mercury's slower rotation
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/venus.png',
                      _venusController,
                      orbitRadius: 65,
                      planetSize: const Size(16, 16),
                      planet: planets[2],
                      selfRotationDuration:
                          Duration(seconds: 6), // Venus' even slower rotation
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/earth.png',
                      _earthController,
                      orbitRadius: 80,
                      planetSize: const Size(16, 16),
                      planet: planets[3],
                      selfRotationDuration:
                          Duration(seconds: 5), // Earth's natural rotation
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/mars.png',
                      _marsController,
                      orbitRadius: 99,
                      planetSize: const Size(18, 18),
                      planet: planets[4],
                      selfRotationDuration:
                          Duration(seconds: 7), // Mars' slower rotation
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/jupiter.png',
                      _jupiterController,
                      orbitRadius: 130,
                      planetSize: const Size(35, 35),
                      planet: planets[5],
                      selfRotationDuration: Duration(
                          seconds:
                              15), // Jupiter's faster but still slowed down
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/saturn.png',
                      _saturnController,
                      orbitRadius: 160,
                      planetSize: const Size(30, 30),
                      planet: planets[6],
                      selfRotationDuration:
                          Duration(seconds: 20), // Saturn's slower rotation
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/uranus.png',
                      _uranusController,
                      orbitRadius: 185,
                      planetSize: const Size(30, 30),
                      planet: planets[7],
                      selfRotationDuration: Duration(
                          seconds: 25), // Uranus' slow and smooth rotation
                    ),
                    _buildPlanetOrbit(
                      'assets/planets/neptune.png',
                      _neptuneController,
                      orbitRadius: 210,
                      planetSize: const Size(40, 40),
                      planet: planets[8],
                      selfRotationDuration: Duration(
                          seconds: 30), // Neptune's slow and smooth rotation
                    ),

                    FutureBuilder<List<NEO>>(
                      future: _neoDataFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              'Error loading NEO data: ${snapshot.error}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        } else if (snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          final neoData = snapshot.data!;

                          // Split NEOs into hazardous (green) and non-hazardous (red) lists
                          final hazardousNEOs = neoData
                              .where((neo) => neo.isPotentiallyHazardous)
                              .toList();
                          final nonHazardousNEOs = neoData
                              .where((neo) => !neo.isPotentiallyHazardous)
                              .toList();

                          return Stack(
                            children: [
                              // Hazardous NEOs (Green) - Display them inside Earth's orbit
                              ...List.generate(hazardousNEOs.length, (index) {
                                return _buildNEOMarker(
                                    hazardousNEOs[index], index,
                                    region:
                                        'inner'); // Position inside Earth's orbit
                              }),

                              // Non-hazardous NEOs (Red) - Display them outside Earth's orbit
                              ...List.generate(nonHazardousNEOs.length,
                                  (index) {
                                return _buildNEOMarker(
                                    nonHazardousNEOs[index], index,
                                    region:
                                        'outer'); // Position outside Earth's orbit
                              }),
                            ],
                          );
                        } else {
                          return const Center(
                              child:
                                  Text('No NEOs available or data is empty'));
                        }
                      },
                    ),
                    // // Planet Buttons
                    // Positioned(
                    //   right: 10,
                    //   top: 100,
                    //   child: Column(
                    //     children: planets.map((planet) {
                    //       return ElevatedButton(
                    //         onPressed: () {
                    //           setState(() {
                    //             _selectedPlanet =
                    //                 planet; // Set the selected planet
                    //           });
                    //         },
                    //         child: Text(planet.name),
                    //       );
                    //     }).toList(),
                    //   ),
                    // ),

                    // // Display selected planet details
                    // if (_selectedPlanet != null)
                    //   Positioned(
                    //     left: 10,
                    //     bottom: 50,
                    //     child: _buildPlanetDetails(_selectedPlanet!),
                    //   ),
                    _buildPlanetButtons(),
                  ],
                ),
              ),
            ),
          ),

          const Positioned(
            top: 0,
            left: 0,
            right: 100,
            child: IgnorePointer(
              ignoring: false,
              child: CNavigationBar(),
            ),
          ),
          // Add Dropdown Menu below the logo
          // Dropdown Menu for NEOs
          Positioned(
            left: 10,
            top: 100,
            child: FutureBuilder<List<NEO>>(
              future: _neoDataFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return _buildDropdown(snapshot.data!);
                } else {
                  return const Text(
                    'Loading NEOs...',
                    style: TextStyle(color: Colors.white),
                  );
                }
              },
            ),
          ),
          // Display selected NEO details
          if (_selectedNEO != null)
            Positioned(
              left: 10,
              bottom: 50,
              child: _buildNEODetails(_selectedNEO!),
            ),
        ],
      ),
    );
  }

  // Widget _buildPlanetDetails(Planet planet) {
  //   return Container(
  //     padding: const EdgeInsets.all(10),
  //     color: Colors.black54,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(planet.name,
  //             style: const TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold)),
  //         Text(planet.size, style: const TextStyle(color: Colors.white)),
  //         Text(planet.position, style: const TextStyle(color: Colors.white)),
  //         Text(planet.lightSource, style: const TextStyle(color: Colors.white)),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildNEODetails(NEO neo) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.black54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${neo.name}',
              style: const TextStyle(color: Colors.white)),
          Text('Distance: ${neo.distanceAU.toStringAsFixed(2)} AU',
              style: const TextStyle(color: Colors.white)),
          Text('Speed: ${neo.velocityKmPerSec.toStringAsFixed(2)} km/s',
              style: const TextStyle(color: Colors.white)),
          Text(
              'Diameter: ${neo.estimatedDiameterMin.toStringAsFixed(2)} - ${neo.estimatedDiameterMax.toStringAsFixed(2)} km',
              style: const TextStyle(color: Colors.white)),
          Text('Hazardous: ${neo.isPotentiallyHazardous ? "Yes" : "No"}',
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildNEOMarker(NEO neo, int index, {required String region}) {
    // Define the orbit radius for Earth's orbit
    final double earthOrbitRadius = 80;

    // Define different distances for inner (hazardous) and outer (non-hazardous) regions
    double minDistanceFromEarth;
    double maxDistanceFromEarth;

    if (region == 'inner') {
      // Hazardous NEOs (green) will be placed inside Earth's orbit
      minDistanceFromEarth = earthOrbitRadius - 10; // Closer to Earth's orbit
      maxDistanceFromEarth = earthOrbitRadius - 10; // Just inside Earth's orbit
    } else {
      // Non-hazardous NEOs (red) will be placed outside Earth's orbit
      minDistanceFromEarth =
          earthOrbitRadius + 10; // Just outside Earth's orbit
      maxDistanceFromEarth =
          earthOrbitRadius + 40; // Farther outside Earth's orbit
    }

    // Randomly adjust the NEO distance to vary them a bit within their defined region
    final double distanceAU = minDistanceFromEarth +
        (math.Random().nextDouble() *
            (maxDistanceFromEarth - minDistanceFromEarth));

    // Randomly select an angle for NEO positioning around Earth's orbit
    final double angleIncrement =
        (2 * math.pi) / 20; // Spread them evenly around Earth's orbit
    final double angle = index * angleIncrement; // Unique angle for each NEO

    // Define the x and y coordinates based on the calculated distance and angle
    final double x = distanceAU * math.cos(angle);
    final double y = distanceAU * math.sin(angle);

    // Check if the NEO is hazardous and set color accordingly
    final Color neoColor =
        neo.isPotentiallyHazardous ? Colors.red : Colors.yellow;

    // Set the size of the NEO marker based on whether it's hazardous or not
    final double neoSize = neo.isPotentiallyHazardous ? 8.0 : 5.0;

    return Positioned(
      left: x +
          MediaQuery.of(context).size.width / 2 -
          neoSize / 2, // Centering the NEO based on size
      top: y + MediaQuery.of(context).size.height / 2 - neoSize / 2,
      child: Tooltip(
        message: '''
        ${neo.name} (${neo.distanceAU.toStringAsFixed(2)} AU)
        Speed: ${neo.velocityKmPerSec.toStringAsFixed(2)} km/s
        Diameter: ${neo.estimatedDiameterMin.toStringAsFixed(2)} - ${neo.estimatedDiameterMax.toStringAsFixed(2)} km
        Hazardous: ${neo.isPotentiallyHazardous ? "Yes" : "No"}
      ''',
        child: Icon(Icons.adjust, size: neoSize, color: neoColor),
      ),
    );
  }

  Widget _buildPlanetOrbit(
    String planetAsset,
    AnimationController orbitController, {
    required double orbitRadius,
    required Size planetSize,
    required Planet planet,
    required Duration selfRotationDuration, // Duration for axis rotation
  }) {
    // Create a secondary animation for the planet's self-rotation
    AnimationController rotationController = AnimationController(
      duration: selfRotationDuration, // Adjust the speed of the self-rotation
      vsync: this,
    )..repeat(); // Continuous rotation

    return AnimatedBuilder(
      animation: orbitController,
      builder: (context, child) {
        double orbitAngle = orbitController.value * 2 * math.pi;
        double x = orbitRadius * math.cos(orbitAngle);
        double y = orbitRadius * math.sin(orbitAngle);

        return Transform.translate(
          offset: Offset(x, y),
          child: GestureDetector(
            onTap: () {
              _showPlanetInfo(planet); // Show planet info
            },
            child: RotationTransition(
              turns: rotationController, // Planet self-rotation animation
              child: Image.asset(
                planetAsset,
                width: planetSize.width,
                height: planetSize.height,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOrbits() {
    return CustomPaint(
      painter: OrbitPainter(),
      size: const Size(400, 400),
    );
  }

  Widget _buildAsteroidBelt() {
    return Positioned(
      child: Image.asset(
        'assets/asteriods/asteriods_belt.png',
        width: 350,
        height: 350,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }

  Widget _buildSecondAsteroidBelt() {
    return Positioned(
      child: Image.asset(
        'assets/asteriods/asteriods_belt.png',
        width: 700,
        height: 700,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}

class OrbitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint orbitPaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    double centerX = size.width / 2;
    double centerY = size.height / 2;

    canvas.drawCircle(Offset(centerX, centerY), 50, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 65, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 80, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 99, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 130, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 160, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 185, orbitPaint);
    canvas.drawCircle(Offset(centerX, centerY), 210, orbitPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
