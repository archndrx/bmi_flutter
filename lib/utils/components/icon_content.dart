import 'package:bmi/utils/constant.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final String? text;
  final IconData? icon;

  const IconContent({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text!,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
