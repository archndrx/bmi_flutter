import 'package:bmi/utils/constant.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function()? onPress;
  final IconData icon;
  const RoundIconButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: const CircleBorder(),
      fillColor: kRoundIconBttonColor,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
    );
  }
}
