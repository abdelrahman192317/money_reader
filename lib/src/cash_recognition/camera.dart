import 'package:flutter/material.dart';
import 'package:money_reader/src/utils/camera.dart';
import 'package:money_reader/src/cash_recognition/classifier.dart';

class CashCamera extends CameraApp {
  const CashCamera({super.key});

  /// Camera Widget for Cash Recognition component inheriting from CameraApp
  @override
  CashCameraState createState() => CashCameraState();
}

class CashCameraState extends CameraAppState {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          /// GestureDetector wraps entire Camera Widget and classifies on tap
          return GestureDetector(
              excludeFromSemantics: true,
              onTap: captureAndClassify,
              child: Tooltip(
                  // add Tooltip for screen readers
                  message: "اضغط مرتين لمعرفة العملة",
                  child: cameraWidget(context)));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> captureAndClassify() async {
    /// Capture an image and classify
    try {
      String path = await captureImage();
      classifyImage(path);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
