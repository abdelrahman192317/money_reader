import 'package:flutter/material.dart';

import '../classifier/classifier.dart';
import '../utils/camera.dart';
import '../utils/media_player.dart';

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
                    if(result == 'default') result = 'wrong';
                    MediaPlayer.playAudio(result);
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
