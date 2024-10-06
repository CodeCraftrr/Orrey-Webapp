import 'package:flutter/material.dart';
import 'package:orrey_web_app/view/info/info.dart';
import 'package:orrey_web_app/view/orrery_view/orrery_view.dart';
import 'package:orrey_web_app/view/team/team.dart';
import 'package:orrey_web_app/widgets/navigation%20bar/navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isHovering = false;

  // Smooth navigation with fade transition
  void _navigateTo(BuildContext context, String routeName) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            getPage(routeName),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Widget getPage(String routeName) {
    switch (routeName) {
      case '/team':
        return const TeamPage();
      case '/orrery':
        return const OrreryView();
      case '/info':
        return const InfoPage();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), // Background image
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
            // Main content (Title + Explore Button)
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title Text
                  const Positioned.fill(
                    bottom: 20,
                    child: Text(
                      'ORRERY WEB APP',
                      style: TextStyle(
                        fontFamily: 'Anton',
                        fontSize: 145,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0.0, 5.0),
                            blurRadius: 10.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Explore Button with hover effect
                  MouseRegion(
                    onEnter: (_) => setState(() {
                      _isHovering = true;
                    }),
                    onExit: (_) => setState(() {
                      _isHovering = false;
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: _isHovering ? 300 : 280,
                      height: _isHovering ? 80 : 75,
                      decoration: BoxDecoration(
                        color: _isHovering
                            ? Colors.blueAccent.withOpacity(0.5)
                            : Colors
                                .transparent, // Background color change on hover
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: _isHovering
                            ? [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ]
                            : null,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _navigateTo(context, '/orrery'); // Smooth navigation
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor:
                              Colors.white, // Button background color
                        ),
                        child: const Text(
                          'EXPLORE',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'Anton',
                          ),
                        ),
                      ),
                    ),
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
