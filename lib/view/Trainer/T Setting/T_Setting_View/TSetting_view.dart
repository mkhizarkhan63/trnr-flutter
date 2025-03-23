import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/T%20Setting/T_Setting_View/TSetting_viewModel.dart';
import 'package:trainr/view/Trainer/components/dialogs/LogoutDialog.dart';

class TSettingView extends StatelessWidget {
  const TSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TSettingViewModel(),
        builder: (context, TSettingViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
              child: PopScope(
                canPop: false,
                onPopInvoked: (status) {
                  if (!status) {
                    viewModel.navigateToHome();
                  }

                  print(status);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          viewModel.navigateToHome();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: ThemeColor.textfieldColor,
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
                            color: ThemeColor.primaryColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 25,
                                color: ThemeColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.textfieldColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.navigateToTMyInformationView();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text(
                          "My Information",
                          style: TextStyle(
                              fontSize: 14, color: ThemeColor.textfieldColor),
                        ),
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.textfieldColor,
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.navigateToTTPaymentpage1view();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: const Text(
                          "Payment Method",
                          style: TextStyle(
                              fontSize: 14, color: ThemeColor.textfieldColor),
                        ),
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.textfieldColor,
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
                              fontSize: 14, color: ThemeColor.textfieldColor),
                        ),
                      ),
                    ),
                    const Divider(
                      color: ThemeColor.textfieldColor,
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
                              fontSize: 14, color: ThemeColor.textfieldColor),
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
