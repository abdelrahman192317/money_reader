import 'dart:io';

import 'package:flutter/material.dart';

class LabelScreen extends StatelessWidget {
  final String label;
  final File file;

  const LabelScreen({super.key, required this.label, required this.file});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(label),
        centerTitle: true,
      ),
      body: Image.file(file, height: size.height, fit: BoxFit.cover),
    );
  }
}
