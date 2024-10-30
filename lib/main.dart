import 'package:cities_of_the_world/ui/cities/pages/cities_page.dart';
import 'package:cities_of_the_world/core/di/cities_of_the_world_di.dart';
import 'package:flutter/material.dart';

void main() async {
  await CitiesOfTheWorldDi.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: CitiesPage(),
        ),
      ),
    );
  }
}
