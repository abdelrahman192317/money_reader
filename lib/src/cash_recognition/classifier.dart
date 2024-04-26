import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:money_reader/src/utils/media_player.dart';
import 'package:tflite/tflite.dart';

String audioFile = "cash_recognition/audio/";
String _modelPath = "assets/cash_recognition/model/model.tflite";
String _labelPath = "assets/cash_recognition/model/labels.txt";

Future<void> classifyImage(String imagePath) async {
  /// Classify the given image
  // load the tfltie model
  await Tflite.loadModel(model: _modelPath, labels: _labelPath);
  // Run the model on image
  // High threshold for better accuracy
  List<dynamic>? output = await (Tflite.runModelOnImage(
      path: imagePath,
      numResults: 2,
      threshold: 0.99,
      imageMean: 117.0,
      imageStd: 1.0,
      asynch: true));
  // Add classified note to database and play the corresponding audio feedback
  if (output!.isNotEmpty) {
    print('here');
    String result = output[0]["label"];
    debugPrint('$result ${output[0]["confidence"]}');
    String note = result.substring(2);
    playAudio(note);
    print(note);
  }
  // else play [wrong.mp3]
  else {
    //await MediaPlayer.playAudio('${audioFile}wrong.mp3');
    // if(HapticFeedback.canVibrate){
    //   Vibrate.feedback(FeedbackType.error);
    // }
  }
}

Future<void> playAudio(String note) async {
  // play an audio feedback corresponding the classified note
  if(note.split(' ')[0] == 'new')note = note.split(' ')[1];
  //await MediaPlayer.playAudio('$audioFile$note.mp3');
}
