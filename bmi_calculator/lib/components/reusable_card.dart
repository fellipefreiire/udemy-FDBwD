import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {Key? key,
      required this.customColor,
      required this.cardChild,
      this.onPress})
      : super(key: key);

  final Color customColor;
  final Widget cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: customColor,
        ),
      ),
      onTap: onPress,
    );
  }
}
