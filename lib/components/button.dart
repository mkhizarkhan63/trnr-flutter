import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String role;
  final String text;

  const MyButton(
      {super.key, required this.role, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: role == "trainer"
                ? ThemeColor.primaryColor
                : ThemeColor.secondaryColor,
            // borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: role == "trainer"
                      ? ThemeColor.backgroundColor
                      : ThemeColor.textfieldColor,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
