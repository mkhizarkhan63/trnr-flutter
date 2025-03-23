import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/DailyProgress/weight/CWeightTab.dart';

import '../../../../assets/variables/themeColor.dart';
import 'Data/CDataTab.dart';
import 'ProgressData/CProgressPhotoTab.dart';
import 'dailyhabits/CDailyHabitsTab.dart';

class CDailyProgressScreen extends StatelessWidget {
  CDailyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: ThemeColor.primaryColor,
          body: Column(
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
                        color: ThemeColor.secondaryColor,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text(
                          "Daily Progress",
                          style: TextStyle(
                              color: ThemeColor.secondaryColor,
                              fontSize: 16,
                              fontFamily: 'verdanab'),
                        )),
                  ],
                ),
              ),
              const Divider(color: Colors.black),
              const TabBar(
                labelPadding: EdgeInsets.all(2),
                indicatorColor: ThemeColor.secondaryColor,
                dividerHeight: 0,
                tabs: [
                  AutoSizeText(
                    "Daily Habits",
                    maxLines: 1,
                    style: TextStyle(
                        color: ThemeColor.secondaryColor, fontSize: 12),
                  ),
                  AutoSizeText(
                    "Weight",
                    maxLines: 1,
                    style: TextStyle(
                        color: ThemeColor.secondaryColor, fontSize: 12),
                  ),
                  AutoSizeText(
                    "Progress Photos",
                    maxLines: 1,
                    style: TextStyle(
                        color: ThemeColor.secondaryColor, fontSize: 12),
                  ),
                  AutoSizeText(
                    "Data",
                    maxLines: 1,
                    style: TextStyle(
                        color: ThemeColor.secondaryColor, fontSize: 12),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TabBarView(
                    children: [
                      CDailyHabitsTab(),
                      CWeightTab(),
                      CProgressPhotoTab(),
                      CDataTab()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
