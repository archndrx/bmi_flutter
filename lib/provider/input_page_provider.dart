import 'package:bmi/utils/state/state.dart';
import 'package:flutter/material.dart';

class InputPageProvider extends ChangeNotifier {
  static var activeCardColour = const Color(0xFF1D1E33);
  static var inactiveCardColour = const Color(0xFF111328);

  Color maleCardColor = inactiveCardColour;
  Color femaleCardColor = inactiveCardColour;

  void updateColor(GenderState gender) {
    if (gender == GenderState.female) {
      if (femaleCardColor == inactiveCardColour) {
        femaleCardColor = activeCardColour;
        maleCardColor = inactiveCardColour;
      } else {
        femaleCardColor = inactiveCardColour;
      }
    } else {
      if (maleCardColor == inactiveCardColour) {
        maleCardColor = activeCardColour;
        femaleCardColor = inactiveCardColour;
      } else {
        maleCardColor = inactiveCardColour;
      }
    }
    notifyListeners();
  }
}
