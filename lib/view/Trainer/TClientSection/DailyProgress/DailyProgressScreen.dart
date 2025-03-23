import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/view/Trainer/TClientSection/DailyProgress/weight/WeightTab.dart';

import '../../../../assets/variables/themeColor.dart';
import 'Data/DataTab.dart';
import 'ProgressData/ProgressPhotoTab.dart';
import 'dailyhabits/DailyHabitsTab.dart';

class DailyProgressScreen extends StatelessWidget {
  DailyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: ThemeColor.textfieldColor,
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text(
                            "Daily Progress",
                            style: TextStyle(
                                color: ThemeColor.primaryColor,
                                fontSize: 16,
                                fontFamily: 'verdanab'),
                          )),
                    ],
                  ),
                ),
                const Divider(color: Colors.black),
                const TabBar(
                  labelPadding: EdgeInsets.all(2),
                  indicatorColor: ThemeColor.textfieldColor,
                  dividerHeight: 0,
                  tabs: [
                    AutoSizeText(
                      "Daily Habits",
                      maxLines: 1,
                      style: TextStyle(
                          color: ThemeColor.textfieldColor, fontSize: 12),
                    ),
                    AutoSizeText(
                      "Weight",
                      maxLines: 1,
                      style: TextStyle(
                          color: ThemeColor.textfieldColor, fontSize: 12),
                    ),
                    AutoSizeText(
                      "Progress Photos",
                      maxLines: 1,
                      style: TextStyle(
                          color: ThemeColor.textfieldColor, fontSize: 12),
                    ),
                    AutoSizeText(
                      "Data",
                      maxLines: 1,
                      style: TextStyle(
                          color: ThemeColor.textfieldColor, fontSize: 12),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TabBarView(
                      children: [
                        DailyHabitsTab(),
                        WeightTab(),
                        ProgressPhotoTab(),
                        DataTab()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
