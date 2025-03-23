import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/Login/login_viewModel.dart';

import '../component/dialogs/loading_dialog.dart';

class LoginView extends StatelessWidget {
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, LoginViewModel viewModel, index) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ThemeColor.backgroundColor,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          "lib/assets/Icons/trainr.png",
                          height: MediaQuery.of(context).size.width * 0.4,
                          color: ThemeColor.primaryColor,
                        ),
                      ),
                      // SvgPicture.asset("lib/assets/Icons/logo.svg"),
                      Form(
                          key: viewModel.formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: SizedBox(
                              width: 250,
                              child: Column(
                                children: [
                                  Container(
                                    width: 250,
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, top: 0, bottom: 0),
                                    decoration: BoxDecoration(
                                      color: ThemeColor.textfieldColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextFormField(
                                      controller: viewModel.nameController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Username can\'t be empty!';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Container(
                                      width: 250,
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 0,
                                          bottom: 0),
                                      decoration: BoxDecoration(
                                        color: ThemeColor.textfieldColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        controller: viewModel.passController,
                                        obscureText: true,
                                        autocorrect: false,
                                        enableSuggestions: false,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Password',
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password can\'t be empty!';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () {
                                          viewModel.navigateToForgetPassView();
                                        },
                                        child: const Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  ThemeColor.textfieldColor,
                                              color: ThemeColor.textfieldColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: SizedBox(
                                      width: 250,
                                      height: 45,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ThemeColor.textfieldColor,
                                          textStyle: const TextStyle(
                                              color:
                                                  ThemeColor.backgroundColor),
                                          foregroundColor:
                                              ThemeColor.backgroundColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        onPressed: () async {
                                          _showLoader();

                                          final response =
                                              await viewModel.login();

                                          Navigator.pop(_context);

                                          if (response != null &&
                                              response.data != null) {
                                            if (response.data?.isVerified ==
                                                true) {
                                              if (response.data?.typeId ==
                                                  Constants.trainer) {
                                                viewModel
                                                    .navigateToTrainerDashboard();
                                              } else {
                                                viewModel
                                                    .navigateToClientDashboard();
                                              }
                                            } else {
                                              viewModel.navigateToOtp();
                                            }
                                          } else {
                                            _showError(response?.message);
                                          }
                                        },
                                        child: viewModel.loginEle,
                                      ),
                                    ),
                                  ),
                                  _socialLogin(context, viewModel),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        viewModel.navigateToRoleSelect();
                                      },
                                      child: const Text(
                                        'New User?',
                                        style: TextStyle(
                                            decorationColor:
                                                ThemeColor.textfieldColor,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 18,
                                            color: ThemeColor.textfieldColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ));
        });
  }

  Widget _socialLoginText() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 3,
              color: ThemeColor.textfieldColor,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Or log in using",
                style: TextStyle(
                    color: ThemeColor.textfieldColor,
                    fontWeight: FontWeight.bold),
              )),
          const Expanded(
            child: Divider(
              thickness: 3,
              color: ThemeColor.textfieldColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLogin(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        _socialLoginText(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Platform.isAndroid
                ? Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        bool check = await viewModel.signInWithGoogle();
                        if (check) {
                          _showLoader();
                          final loginResponse = await viewModel.socialLogin();

                          Navigator.pop(_context);

                          if (loginResponse?.data != null) {
                            if (loginResponse?.data?.isVerified == true) {
                              if (loginResponse?.data?.typeId ==
                                  Constants.trainer) {
                                viewModel.navigateToTrainerDashboard();
                              } else {
                                viewModel.navigateToClientDashboard();
                              }
                            } else {
                              viewModel.navigateToOtp();
                            }
                          } else {
                            viewModel.navigateToRoleSelect();
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Center(
                            child: Text("Sign-in Failed"),
                          )));
                        }
                      },
                      child: Image.asset(
                        'lib/assets/Icons/google.png',
                      ),
                    ),
                  )
                : Container(),
            Platform.isIOS
                ? Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        bool check = await viewModel.signInWithApple();
                        if (check) {
                          viewModel.navigateToRoleSelect();
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  content: Center(
                            child: Text("Sign-in Failed"),
                          )));
                        }
                      },
                      child: Image.asset(
                        'lib/assets/Icons/icon_apple.png',
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  bool check = await viewModel.signInWithFacebook();
                  if (check) {
                    viewModel.navigateToRoleSelect();
                  } else {
                    ScaffoldMessenger.of(_context).showSnackBar(const SnackBar(
                        content: Center(
                      child: Text("Sign-in Failed"),
                    )));
                  }
                },
                child: Image.asset(
                  'lib/assets/Icons/facebook.png',
                  height: 65,
                  width: 65,
                ),
              ),
            ),
          ],
        )
      ],
    );
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
