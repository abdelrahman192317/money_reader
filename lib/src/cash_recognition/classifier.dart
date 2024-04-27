import 'package:tflite/tflite.dart';

String _modelPath = "assets/cash_recognition/model/model.tflite";
String _labelPath = "assets/cash_recognition/model/labels.txt";

class Classifier{
  static Future<List<dynamic>?> classifyImage(String imagePath) async {

    await Tflite.loadModel(model: _modelPath, labels: _labelPath);

    return await Tflite.runModelOnImage(
        path: imagePath, numResults: 5, threshold: 0.1,
        imageMean: 117.0, imageStd: 1.0, asynch: true
    );
  }
}
