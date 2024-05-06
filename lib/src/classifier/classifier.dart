import 'package:tflite/tflite.dart';

String _modelPath = "assets/cash_recognition/model/model.tflite";
String _labelPath = "assets/cash_recognition/model/labels.txt";

class Classifier{

  static Future<void> loadModel() async =>
    await Tflite.loadModel(model: _modelPath, labels: _labelPath);

  static Future<List<dynamic>?> classifyImage(String imagePath) async {

    await Tflite.loadModel(model: _modelPath, labels: _labelPath);

    return await Tflite.runModelOnImage(
        path: imagePath, numResults: 2, threshold: 0.1,
        imageMean: 127.5, imageStd: 127.5, asynch: true
    );
  }

}
