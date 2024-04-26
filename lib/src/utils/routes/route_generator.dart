import 'package:money_reader/src/home/home_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return _errorRoute();
    }
  }

  static _errorRoute() => MaterialPageRoute(
        builder: (context) => const Material(
          child: Center(
            child: Text("404 Not Found!"),
          ),
        ),
      );
}
