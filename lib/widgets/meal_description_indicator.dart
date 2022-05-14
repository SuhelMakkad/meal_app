import 'package:flutter/material.dart';

class MealDescriptionIndicator extends StatelessWidget {
  const MealDescriptionIndicator({
    Key? key,
    required this.affordability,
    required this.icon,
  }) : super(key: key);

  final String affordability;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 6,
        ),
        Text(affordability),
      ],
    );
  }
}
