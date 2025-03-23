import 'package:flutter/material.dart';

import '../../../assets/variables/themeColor.dart';

class RowLanguage extends StatelessWidget {
  final String language;
  final String role;
  final bool isEditable;
  final Function() onDeleteClick;

  RowLanguage(
      {super.key,
      required this.language,
      required this.role,
      required this.isEditable,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: role == "trainer"
                ? ThemeColor.primaryColor
                : ThemeColor.secondaryColor,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              language,
              style: TextStyle(
                  fontSize: 12,
                  color: role == "trainer"
                      ? ThemeColor.primaryColor
                      : ThemeColor.secondaryColor),
            ),
            isEditable ? _deleteButton() : Container()
          ],
        ),
      ),
    );
  }

  Widget _deleteButton() {
    return GestureDetector(
      onTap: onDeleteClick,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        alignment: Alignment.center,
        child: const Icon(
          Icons.close,
          size: 25,
          color: Colors.red,
        ),
      ),
    );
  }
}
