import 'package:flutter/material.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

import '../../../assets/variables/themeColor.dart';

class RowSelectSpeciality extends StatelessWidget {
  final SpecializationData speciality;
  final String role;
  final Function() onSpecialityClick;

  const RowSelectSpeciality(
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
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  speciality.name ?? "",
                  style: TextStyle(
                      color: role == "trainer"
                          ? ThemeColor.backgroundColor
                          : ThemeColor.primaryColor,
                      fontSize: 14),
                ),
                speciality.isSelected
                    ? Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Icon(Icons.done,
                            color: role == "trainer"
                                ? ThemeColor.backgroundColor
                                : ThemeColor.primaryColor),
                      )
                    : const SizedBox(
                        height: 5,
                      )
              ],
            )),
      ),
    );
  }
}
