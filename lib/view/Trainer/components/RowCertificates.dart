import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowCertificates extends StatelessWidget {
  final String certificate;
  final bool isEditable;
  final String role;
  final Function() onDeleteClick;

  RowCertificates(
      {super.key,
      required this.certificate,
      required this.role,
      required this.isEditable,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColor.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            certificate,
            style: TextStyle(
                fontSize: 14,
                color: role == "trainer"
                    ? ThemeColor.primaryColor
                    : ThemeColor.secondaryColor),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Icon(
              Icons.file_copy_rounded,
              size: 20,
              color: role == "trainer"
                  ? ThemeColor.primaryColor
                  : ThemeColor.secondaryColor,
            ),
          ),
          isEditable ? _deleteButton() : Container()
        ],
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
