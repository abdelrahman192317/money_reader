import 'package:flutter/material.dart';

import 'src/home/home_screen.dart';
import 'src/utils/haptic_feedback.dart';
import 'src/utils/routes/route_generator.dart';
import 'src/utils/routes/route_observer.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HapticFeedback.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Render the Home Screen view
    return MaterialApp(
      navigatorObservers: [AppRouteObserver()],
      home: HomeScreen(),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
