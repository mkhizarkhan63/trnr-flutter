import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowCardio extends StatelessWidget {
  final String name;
  final String days;
  final String time;
  final String round;
  final String rest;
  final String duration;
  final bool isEditable;
  final Function() onDeleteClick;

  const RowCardio(
      {super.key,
      required this.name,
      required this.days,
      required this.time,
      required this.round,
      required this.rest,
      required this.duration,
      required this.isEditable,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isEditable
                  ? GestureDetector(
                      onTap: onDeleteClick,
                      child: const Center(
                        child: Icon(
                          Icons.delete,
                          size: 30,
                          color: ThemeColor.textfieldColor,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                width: 200,
                height: 45,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: ThemeColor.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(
                        child: AutoSizeText(
                          "Cardio",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          name,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 18,
                            color: ThemeColor.textfieldColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ThemeColor.textfieldColor,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Days:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        days,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Time:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          time,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Min/Hrs:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: AutoSizeText(
                          duration,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Round:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          round,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Rest:",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$rest minutes",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: ThemeColor.primaryColor,
        ),
      ],
    );
  }
}
