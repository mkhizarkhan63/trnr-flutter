import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/PackagesTab/packagesTab_viewModel.dart';

import '../../../../../../assets/variables/themeColor.dart';
import '../../../../../Trainer/components/RowPackage.dart';

class CTSubscriptionPlanScreen extends StatelessWidget {
  CTSubscriptionPlanScreen({super.key, required this.trainerId});

  int trainerId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PackagesTabViewModel(),
      builder: (ctx, viewModel, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Prices & Packages',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: ThemeColor.fontColor,
                  decorationColor: ThemeColor.fontColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Expanded(
                child: viewModel.userPackages.isNotEmpty
                    ? ListView.builder(
                        itemCount: viewModel.userPackages.length,
                        itemBuilder: (context, index) {
                          return RowPackage(
                            sessions: "1",
                            price: "200",
                            role: "client",
                            onDeleteClick: () {},
                          );
                        })
                    : Container(
                        margin: const EdgeInsets.all(20),
                        child: const Center(
                            child: Text(
                          "No user packages",
                          style: TextStyle(
                              fontSize: 16, color: ThemeColor.primaryColor),
                        )))),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  "Capacity: 0",
                  style:
                      TextStyle(color: ThemeColor.primaryColor, fontSize: 16),
                )),
          ],
        );
      },
    );
  }
}
