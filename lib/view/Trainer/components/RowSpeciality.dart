import 'package:flutter/material.dart';

import '../../../assets/variables/themeColor.dart';

class RowSpeciality extends StatelessWidget {
  final String speciality;
  final String role;
  final Function() onSpecialityClick;

  const RowSpeciality(
      {super.key,
      required this.speciality,
      required this.role,
      required this.onSpecialityClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSpecialityClick,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: role == "trainer"
                  ? ThemeColor.textfieldColor
                  : ThemeColor.fontColor,
            ),
            child: Text(
              speciality,
              style: TextStyle(
                  color: role == "trainer"
                      ? ThemeColor.backgroundColor
                      : ThemeColor.primaryColor,
                  fontSize: 14),
            )),
      ),
    );
  }
}
