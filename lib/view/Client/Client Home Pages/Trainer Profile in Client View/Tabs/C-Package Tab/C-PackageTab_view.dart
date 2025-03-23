import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-Package%20Tab/CSessionsScreen.dart';

import 'CTSubscriptionPlanScreen.dart';

class CPackageTabView extends StatelessWidget {
  CPackageTabView({super.key, required this.trainerId});

  int trainerId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            const TabBar(
              dividerColor: ThemeColor.primaryColor,
              padding: EdgeInsets.all(0),
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: [
                Icon(
                  Icons.price_change,
                  size: 40,
                ),
                Icon(
                  Icons.group,
                  size: 40,
                ),
              ],
            ),
            Expanded(
                child: TabBarView(children: [
              CTSubscriptionPlanScreen(
                trainerId: trainerId,
              ),
              CSessionScreen(
                trainerId: trainerId,
              )
            ]))
          ],
        ),
      ),
    );
  }
}
