import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../assets/variables/themeColor.dart';

class RowExerciseHeading extends StatelessWidget {
  final String heading;
  final String role;

  const RowExerciseHeading(
      {super.key, required this.heading, required this.role});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: role == "trainer"
                    ? ThemeColor.primaryColor
                    : ThemeColor.secondaryColor)),
        child: AutoSizeText(
          heading,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: role == "trainer"
                ? ThemeColor.primaryColor
                : ThemeColor.secondaryColor,
          ),
        ),
      ),
    );
  }
}
