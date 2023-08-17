import 'package:bmi/utils/state/state.dart';
import 'package:flutter/material.dart';

class InputPageProvider extends ChangeNotifier {
  GenderState _selectedGender = GenderState.none;
  int _height = 180;
  int _weight = 74;
  int _age = 19;

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
}
