import 'package:flutter/material.dart';
import 'package:money_reader/src/cash_recognition/camera.dart';

class CashRecognitionMainScreen extends StatelessWidget {
  const CashRecognitionMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CashCamera(),
    );
  }
}
