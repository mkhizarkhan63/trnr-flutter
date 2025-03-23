import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/PackagesTab/SessionsScreen.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/PackagesTab/SubscriptionPlanScreen.dart';

class PackagesTabView extends StatelessWidget {
  PackagesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TabBar(
              padding: const EdgeInsets.all(0),
              indicatorPadding: const EdgeInsets.all(0),
              indicatorColor: ThemeColor.textfieldColor,
              labelColor: ThemeColor.textfieldColor,
              dividerColor: Colors.transparent,
              tabs: [
                Icon(
                  Icons.discount_outlined,
                  color: ThemeColor.textfieldColor,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
                Icon(
                  Icons.group,
                  color: ThemeColor.textfieldColor,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
                children: [const SubscriptionPlanScreen(), SessionScreen()]),
          )
        ],
      ),
    );
  }
}
