import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../assets/variables/themeColor.dart';

class RowSupplement extends StatelessWidget {
  final String name;
  final String dosage;
  final String time;
  final bool isEditable;
  final Function() onDeleteClick;

  const RowSupplement(
      {super.key,
      required this.name,
      required this.dosage,
      required this.time,
        required this.isEditable,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: AutoSizeText(
                  maxLines: 2,
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: ThemeColor.textfieldColor, fontSize: 12),
                ),
              ),
              Container(
                width: 1,
                height: 30,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                color: ThemeColor.textColor,
              ),
              Expanded(
                child: AutoSizeText(
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  dosage,
                  style: const TextStyle(
                      color: ThemeColor.textfieldColor, fontSize: 12),
                ),
              ),
              Container(
                width: 1,
                height: 30,
                color: ThemeColor.textColor,
              ),
              Expanded(
                child: AutoSizeText(
                  time,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                      color: ThemeColor.textfieldColor, fontSize: 12),
                ),
              ),
              isEditable?GestureDetector(
                onTap: onDeleteClick,
                child: const Icon(
                  Icons.delete,
                  color: ThemeColor.textfieldColor,
                ),
              ):Container()
            ],
          ),
        ),
        const Divider(
          color: ThemeColor.textColor,
        )
      ],
    );
  }
}
