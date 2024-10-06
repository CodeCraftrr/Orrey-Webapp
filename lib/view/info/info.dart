import 'package:flutter/material.dart';
import 'package:orrey_web_app/widgets/navigation%20bar/navigation_bar.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Adjust font size and padding based on screen size
    final paddingLeft = screenSize.width * 0.15; // Dynamic left padding
    final paddingRight = screenSize.width * 0.1; // Dynamic right padding
    final fontSizeTitle = screenSize.width * 0.03; // Dynamic title font size
    final fontSizeBody = screenSize.width * 0.01; // Dynamic body font size
    final paddingTopTitle =
        screenSize.height * 0.09; // Dynamic top padding for title

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.png'), // Bg image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Navigation bar
            const Positioned(
              top: 0,
              left: 0,
              right: 100,
              child: CNavigationBar(),
            ),

            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side: Text content with updated dynamic padding
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: paddingLeft), // Dynamic left padding
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height:
                                    paddingTopTitle), // Add dynamic padding above title
                            Text(
                              "ORRERY WEB APP PROJECT",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontFamily: 'Anton',
                                fontSize:
                                    fontSizeTitle, // Dynamic title font size
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Formatted first paragraph with specific padding to astronaut image
                            Padding(
                              padding: EdgeInsets.only(
                                  right: paddingRight), // Dynamic right padding
                              child: Text(
                                "This project is a 2D interactive orrery web app that dynamically showcases "
                                "our solar system and Near-Earth Objects (NEOs). Users can explore planets, asteroids, "
                                "and comets, and visualize their orbits and movements. The app fetches real-time data from "
                                "NASA APIs to update the positions and trajectories of NEOs, providing an educational "
                                "and visually engaging experience. This allows users to better understand the solar system "
                                "and the behavior of asteroids in our vicinity.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize:
                                      fontSizeBody, // Dynamic body font size
                                  height: 1.5,
                                  fontFamily: 'OpenSans-Regular',
                                  shadows: const [
                                    Shadow(
                                      offset: Offset(0.0, 5.0),
                                      blurRadius: 10.0,
                                      color: Color.fromARGB(128, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 39),
                            // Info Point 01 with dynamic padding
                            Padding(
                              padding: EdgeInsets.only(
                                  right: paddingRight), // Dynamic right padding
                              child: _buildInfoPoint(
                                "01",
                                "The web is powered by NASA's APIs, allowing it to fetch and display real-time data "
                                    "about the positions and movements of various celestial bodies, such as planets, Near-Earth "
                                    "Asteroids (NEAs), and comets. This ensures the information presented is always up-to-date "
                                    "and accurate, providing users with a reliable source for understanding the dynamic nature "
                                    "of our solar system.",
                                fontSizeBody, // Dynamic font size for info point text
                              ),
                            ),
                            const SizedBox(height: 50),
                            // Info Point 02 with dynamic padding
                            Padding(
                              padding: EdgeInsets.only(
                                  right: paddingRight), // Dynamic right padding
                              child: _buildInfoPoint(
                                "02",
                                "The orrery model is designed to be highly interactive, enabling users to explore the "
                                    "solar system in an engaging way. Users can navigate through the solar system, zoom in on "
                                    "individual planets and asteroids, and even view their orbits and trajectories. The interface "
                                    "is intuitive, making it easy to switch between different views and focus on specific celestial bodies.",
                                fontSizeBody, // Dynamic font size for info point text
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Right side: Astronaut image
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Image.asset(
                            'assets/images/astronaut.png', // Replace with the actual image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget to build the numbered info points
  Widget _buildInfoPoint(String number, String description, double fontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize, // Dynamic font size for number
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans-Regular',
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: fontSize, // Dynamic font size for description
              height: 1.5,
              fontFamily: 'OpenSans-Regular',
            ),
          ),
        ),
      ],
    );
  }
}
