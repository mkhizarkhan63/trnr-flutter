import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowExercise extends StatelessWidget {
  final String name;
  final String sets;
  final String reps;
  final bool isEditable;
  final Function() onDeleteClick;

  const RowExercise(
      {required this.name,
      required this.sets,
      required this.reps,
      required this.isEditable,
      required this.onDeleteClick,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColor.primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              if (isEditable)
                GestureDetector(
                  onTap: onDeleteClick,
                  child: const Icon(
                    Icons.delete,
                    color: ThemeColor.textfieldColor,
                  ),
                )
              else
                Container(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    name,
                    style: const TextStyle(
                        fontSize: 14, color: ThemeColor.textfieldColor),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    sets,
                    style: const TextStyle(
                        fontSize: 14, color: ThemeColor.textfieldColor),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AutoSizeText(
                    reps,
                    style: const TextStyle(
                        fontSize: 14, color: ThemeColor.textfieldColor),
                  ),
                ),
              ),
              const Icon(
                Icons.videocam_rounded,
                color: ThemeColor.textfieldColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
