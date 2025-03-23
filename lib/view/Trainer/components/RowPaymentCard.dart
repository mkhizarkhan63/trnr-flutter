import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowPaymentCard extends StatelessWidget {
  final String role;
  final Function() onEditClick;
  final Function() onDeleteClick;

  const RowPaymentCard(
      {super.key,
      required this.role,
      required this.onEditClick,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: role == "trainer"
                    ? ThemeColor.textfieldColor
                    : ThemeColor.secondaryColor)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          children: [
            Icon(
              Icons.card_giftcard,
              color: role == "trainer"
                  ? ThemeColor.textfieldColor
                  : ThemeColor.secondaryColor,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "2345",
                      maxLines: 1,
                      style: TextStyle(
                          color: role == "trainer"
                              ? ThemeColor.textfieldColor
                              : ThemeColor.secondaryColor,
                          fontSize: 16,
                          decorationColor: role == "trainer"
                              ? ThemeColor.textfieldColor
                              : ThemeColor.secondaryColor,
                          decoration: TextDecoration.underline),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "XXXX",
                        maxLines: 1,
                        style: TextStyle(
                            color: role == "trainer"
                                ? ThemeColor.textfieldColor
                                : ThemeColor.secondaryColor,
                            fontSize: 16,
                            decorationColor: role == "trainer"
                                ? ThemeColor.textfieldColor
                                : ThemeColor.secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Text(
                      maxLines: 1,
                      "XXXX",
                      style: TextStyle(
                          color: role == "trainer"
                              ? ThemeColor.textfieldColor
                              : ThemeColor.secondaryColor,
                          fontSize: 16,
                          decorationColor: role == "trainer"
                              ? ThemeColor.textfieldColor
                              : ThemeColor.secondaryColor,
                          decoration: TextDecoration.underline),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "XXXX",
                        style: TextStyle(
                            color: role == "trainer"
                                ? ThemeColor.textfieldColor
                                : ThemeColor.secondaryColor,
                            fontSize: 16,
                            decorationColor: role == "trainer"
                                ? ThemeColor.textfieldColor
                                : ThemeColor.secondaryColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                GestureDetector(
                  child: Text(
                    "Edit",
                    maxLines: 1,
                    style: TextStyle(
                        color: role == "trainer"
                            ? ThemeColor.textfieldColor
                            : ThemeColor.secondaryColor,
                        fontSize: 14,
                        decorationColor: role == "trainer"
                            ? ThemeColor.textfieldColor
                            : ThemeColor.secondaryColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "Delete",
                    maxLines: 1,
                    style: TextStyle(
                        color: role == "trainer"
                            ? ThemeColor.textfieldColor
                            : ThemeColor.secondaryColor,
                        fontSize: 14,
                        decorationColor: role == "trainer"
                            ? ThemeColor.textfieldColor
                            : ThemeColor.secondaryColor,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
