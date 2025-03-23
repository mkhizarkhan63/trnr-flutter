import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowCGoal extends StatelessWidget {
  final String startDate;
  final String goalDetails;
  final String completionDate;

  const RowCGoal(
      {super.key,
      required this.startDate,
      required this.goalDetails,
      required this.completionDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: ThemeColor.secondaryColor, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(startDate,
                        style: const TextStyle(
                            fontSize: 14, color: ThemeColor.secondaryColor)),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(goalDetails,
                            style: const TextStyle(
                                fontSize: 14,
                                color: ThemeColor.secondaryColor))),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          const Spacer(),
                          Row(
                            children: [
                              const Text(
                                "Date of completion:",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ThemeColor.secondaryColor),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  completionDate,
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
