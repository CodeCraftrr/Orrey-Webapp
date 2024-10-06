import 'package:flutter/material.dart';
import 'package:orrey_web_app/view/home/home_view.dart';
import 'package:orrey_web_app/view/info/info.dart';
import 'package:orrey_web_app/view/orrery_view/orrery_view.dart';
import 'package:orrey_web_app/view/team/team.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orrery Web App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open_Sans',
            ),
        brightness: Brightness.light,
      ),
      initialRoute: '/', // Home (Landing) Page
      routes: {
        '/': (context) => const HomeView(), // Landing Page
        '/orrery': (context) => const OrreryView(), // Orrery Page
        '/info': (context) => const InfoPage(), // Info Page
        '/team': (context) => const TeamPage(), // Team Page
      },
    );
  }
}
