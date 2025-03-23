import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/RoleSelect/roleSelect_viewModel.dart';

import '../component/dialogs/loading_dialog.dart';

class RoleSelectView extends StatelessWidget {
  RoleSelectView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    final params = ModalRoute.of(context)?.settings.arguments;

    print("role: params $params");

    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => RoleSelectViewModel(),
        builder: (context, viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            appBar: AppBar(
              backgroundColor: ThemeColor.backgroundColor,
              leading: IconButton(
                  onPressed: () {
                    viewModel.navigateToLogin();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ThemeColor.textfieldColor,
                  )),
            ),
            body: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if (!status) {
                  viewModel.navigateToLogin();
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ARE YOU A",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.w600,
                          color: ThemeColor.primaryColor,
                          fontFamily: 'verdanab'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            Constants.keyFrom = "trainer";

                            final checkFrom = viewModel.from();

                            if (checkFrom == Constants.fromFb ||
                                checkFrom == Constants.fromGoogle ||
                                checkFrom == Constants.fromApple) {
                              _showLoader();
                              final response =
                                  await viewModel.trainerSocialLogin();
                              Navigator.pop(_context);
                              if (response?.data != null) {
                                viewModel.navigateToOtp(response?.data);
                              } else {
                                _showError(response?.message);
                              }
                            } else {
                              viewModel.navigateToTRegistrationForm();
                            }
                          },
                          child: Text(
                            'TRAINER',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w800,
                              color: ThemeColor.backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "OR",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontWeight: FontWeight.w600,
                            color: ThemeColor.primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.width * 0.2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () async {
                            Constants.keyFrom = "client";

                            final checkFrom = viewModel.from();

                            if (checkFrom == Constants.fromFb ||
                                checkFrom == Constants.fromGoogle ||
                                checkFrom == Constants.fromApple) {
                              _showLoader();
                              final response =
                                  await viewModel.trainerSocialLogin();
                              Navigator.pop(_context);
                              if (response?.data != null) {
                                viewModel.navigateToOtp(response?.data);
                              } else {
                                _showError(response?.message);
                              }
                            } else {
                              viewModel.navigateToClientRegistration();
                            }
                          },
                          child: Text(
                            'CLIENT',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w800,
                              color: ThemeColor.backgroundColor,
                            ),
                          ),
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

  _showLoader() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) {
          return const LoadingDialog(message: "Please wait....");
        });
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
