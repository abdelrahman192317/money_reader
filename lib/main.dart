import 'package:flutter/material.dart';

import 'src/home/home_screen.dart';
import 'src/utils/routes/route_generator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Render the Home Screen view
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      home: HomeScreen(),
    );
  }
}
