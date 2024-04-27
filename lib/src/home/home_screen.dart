import 'package:flutter/material.dart';

import '../cash_recognition/cash_camera.dart';
import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void dispose() {
    myCameraController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: CashCamera()
    );
  }
}
