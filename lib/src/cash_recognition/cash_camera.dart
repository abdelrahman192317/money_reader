import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_reader/src/home/label_screen.dart';

import 'package:money_reader/src/utils/camera.dart';

import '../utils/media_player.dart';
import 'classifier.dart';

class CashCamera extends CameraApp {
  const CashCamera({super.key});

  @override
  CashCameraState createState() => CashCameraState();
}

class CashCameraState extends CameraAppState {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initController,
      builder: (context, snapshot) => snapshot.connectionState == ConnectionState.done?
         GestureDetector(
            excludeFromSemantics: true,
            onTap: () {
              captureImage().then((path) {
                Classifier.classifyImage(path).then((output) {
                  if (output!.isNotEmpty) {
                    String result = output[0]["label"];
                    result = result.substring(2);
                    MediaPlayer.playAudio(result);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) =>
                            LabelScreen(label: result, file: File(path))));
                  } else {
                    MediaPlayer.playAudio('wrong');
                  }
                });
              });
            },
            child: const Tooltip(
              message: "اضغط مرتين لمعرفة العملة",
              child: CameraApp())) :
      const Center(child: CircularProgressIndicator())
    );
  }
}
