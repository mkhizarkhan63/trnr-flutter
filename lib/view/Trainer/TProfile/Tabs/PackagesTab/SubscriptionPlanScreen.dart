import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/PackagesTab/packagesTab_viewModel.dart';
import '../../../../../assets/variables/themeColor.dart';
import '../../../components/RowPackage.dart';
import '../../../components/dialogs/package/AddPackageDialog.dart';

class SubscriptionPlanScreen extends StatelessWidget {
  const SubscriptionPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PackagesTabViewModel(),
      builder: (ctx, viewModel, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Prices & Packages',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ThemeColor.textfieldColor,
                    decorationColor: ThemeColor.textfieldColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const AddPackageDialog();
                          });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      size: 25,
                      color: ThemeColor.textfieldColor,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: viewModel.userPackages.isNotEmpty
                    ? ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return RowPackage(
                            sessions: "10",
                            price: "2000",
                            role: "trainer",
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
