import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/Login/login_view.dart';
import 'package:trainr/view/splash/splash_viewModel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (viewModel) {
        Timer(const Duration(seconds: 3), () async {
          final userData = await viewModel.getUserDetails();

          if (userData?.typeId == Constants.trainer) {
            viewModel.navigateToTrainerDashboard();
          } else if (userData?.typeId == Constants.client) {
            viewModel.navigateToClientDashboard();
          } else {
            viewModel.navigateToLogin();
          }
        });
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: Center(
            child: Image.asset(
              "lib/assets/Icons/trainr.png",
              height: MediaQuery.of(context).size.width * 0.4,
              color: ThemeColor.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
