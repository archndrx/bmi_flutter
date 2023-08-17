import 'package:bmi/utils/state/state.dart';
import 'package:flutter/material.dart';

class InputPageProvider extends ChangeNotifier {
  GenderState _selectedGender = GenderState.none;
  int _height = 180;
  int _weight = 74;
  int _age = 19;
  late double _bmi;

  GenderState get selectedGender => _selectedGender;
  int get height => _height;
  int get weight => _weight;
  int get age => _age;

  void updateGender(GenderState newGender) {
    _selectedGender = newGender;
    notifyListeners();
  }

  void updateHeight(int newHeight) {
    _height = newHeight;
    notifyListeners();
  }

  void updateWeight(int newWeight) {
    _weight = newWeight;
    notifyListeners();
  }

  void updateAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  String calculateBMI() {
    _bmi = _weight / ((_height / 100) * (_height / 100));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
