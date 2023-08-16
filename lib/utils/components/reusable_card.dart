import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;

  const ReusableCard(
      {super.key, required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
