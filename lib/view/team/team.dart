import 'package:flutter/material.dart';
import 'package:orrey_web_app/widgets/navigation%20bar/navigation_bar.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Screen size ke liye MediaQuery ka use
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Navigation Bar
            const Positioned(
              top: 0,
              left: 0,
              right: 100,
              child: CNavigationBar(),
            ),

            // Main Content
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.15, // 15% of screen height
                      bottom: screenHeight * 0.05, // 5% of screen height
                    ),
                    child: Text(
                      'MEET OUR TEAM',
                      style: TextStyle(
                        fontFamily: 'Anton',
                        color: Colors.white,
                        fontSize: screenWidth * 0.05, // 6% of screen width
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05, // 5% of screen height
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Team member cards with responsive padding
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01, // 1% of screen width
                        ),
                        child: teamMemberCard(
                          'Muhammad Jawad Usman',
                          'A skilled backend developer, efficiently\n handling database management and API\n integrations with a focus on robust\n solutions.',
                          'assets/images/jawad_usman.png',
                          screenWidth,
                          screenHeight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01, // 1% of screen width
                        ),
                        child: teamMemberCard(
                          'Muhammad Usama Khan',
                          'A passionate tech enthusiast and problem-solver,\n leading the team with innovative ideas and\n strategic vision.\n Single-handedly designed the UI\n and managed the front-end development.',
                          'assets/images/usama_khan.png',
                          screenWidth,
                          screenHeight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.01, // 1% of screen width
                        ),
                        child: teamMemberCard(
                          'Ayesha Mishree',
                          'A talented backend engineer, ensuring\n seamless data integration and server\n management for a smooth user\n experience.',
                          'assets/images/ayesha_mishree.png',
                          screenWidth,
                          screenHeight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget teamMemberCard(String name, String description, String imagePath, double screenWidth, double screenHeight) {
  return Column(
    children: [
      // Responsive image size
      Container(
        height: screenHeight * 0.25, // 25% of screen height
        width: screenWidth * 0.15, // 15% of screen width
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      SizedBox(height: screenHeight * 0.02), // 2% of screen height
      Text(
        name,
        style: TextStyle(
          fontSize: screenWidth * 0.01, // 2% of screen width
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(height: screenHeight * 0.01), // 1% of screen height
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // 2% of screen width
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.010, // 1.4% of screen width
            color: Colors.white70,
          ),
        ),
      ),
    ],
  );
}
