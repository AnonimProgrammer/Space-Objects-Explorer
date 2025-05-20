import 'package:flutter/material.dart';
import 'package:space_objects_explorer_app/pages/asteroids/asteroids_list_page.dart';
import 'package:space_objects_explorer_app/pages/home_page.dart';
import 'package:space_objects_explorer_app/pages/planets/planets_list_page.dart';
import 'package:space_objects_explorer_app/pages/preview_page.dart';
import 'package:space_objects_explorer_app/pages/satellites/satellites_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: AppBarTheme(
        color: Colors.white,
      )),
      title: 'Space Explorer',
      routes: {
        '/home': (context) => HomePage(),
        '/asteroids': (context) => AsteroidsListPage(),
        '/planets': (context) => PlanetsListPage(),
        '/satellites': (context) => SatellitesListPage(),
      },
      home: const PreviewPage(),
    );
  }
}
