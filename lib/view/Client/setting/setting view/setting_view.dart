import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/setting/setting%20view/setting_viewModel.dart';

import '../../../Trainer/components/dialogs/LogoutDialog.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SettingViewModel(),
        builder: (context, SettingViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if (!status) {
                  viewModel.navigateToProfile();
                }
              },
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          viewModel.navigateToProfile();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: ThemeColor.secondaryColor,
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: ThemeColor.secondaryColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 25,
                                color: ThemeColor.secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.secondaryColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.navigateToMyInformation();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text(
                          "My Information",
                          style: TextStyle(
                              fontSize: 14, color: ThemeColor.secondaryColor),
                        ),
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.secondaryColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.navigateTPaymentPage1();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text(
                          "Payment Method",
                          style: TextStyle(
                              fontSize: 14, color: ThemeColor.secondaryColor),
                        ),
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.secondaryColor,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text(
                          "Chat with us",
                          style: TextStyle(
                              fontSize: 14, color: ThemeColor.secondaryColor),
                        ),
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.secondaryColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return LogoutDialog(
                                onLogoutClick: () {
                                  Navigator.pop(context);
                                  viewModel.logout();
                                },
                              );
                            });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 14, color: ThemeColor.secondaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
