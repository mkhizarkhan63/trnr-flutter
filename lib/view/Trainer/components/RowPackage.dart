import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowPackage extends StatelessWidget {
  final String sessions;
  final String price;
  final String role;
  final Function() onDeleteClick;

  const RowPackage(
      {super.key,
      required this.sessions,
      required this.price,
      required this.role,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              border: Border.all(
                color: role == "trainer"
                    ? ThemeColor.primaryColor
                    : ThemeColor.secondaryColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: role == "trainer"
                          ? ThemeColor.primaryColor
                          : ThemeColor.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AutoSizeText(
                      maxLines: 1,
                      "$sessions sessions",
                      style: TextStyle(
                          color: role == "trainer"
                              ? ThemeColor.secondaryColor
                              : ThemeColor.textfieldColor,
                          fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: AutoSizeText(
                      maxLines: 1,
                      'AED $price / session',
                      style: TextStyle(
                        fontSize: 14,
                        color: role == "trainer"
                            ? ThemeColor.primaryColor
                            : ThemeColor.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          role == "trainer"
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: GestureDetector(
                      onTap: onDeleteClick,
                      child: const Icon(
                        Icons.delete,
                        color: ThemeColor.primaryColor,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
