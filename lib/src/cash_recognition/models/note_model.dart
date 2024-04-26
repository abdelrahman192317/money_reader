import 'package:flutter/material.dart';
import 'package:money_reader/src/utils/colors.dart';

class Note {

  static final Map<String, Color> noteToColor = {
    'ten': tenColor,
    'twenty': twentyColor,
    'five': fiveColor,
    'new ten': tenColor,
    'new twenty': twentyColor,
    'fifty': fiftyColor,
    'hundred': hundredColor,
    'twoHundred': twoHundredColor,
  };
}
