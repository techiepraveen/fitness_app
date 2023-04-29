import 'package:flutter/foundation.dart';

class BmiProvider with ChangeNotifier {
  int bmiVal = 0;

  void BMICalculator(String a, String b) {
    bmiVal = int.parse(a) + int.parse(b);
    notifyListeners();
  }
}
