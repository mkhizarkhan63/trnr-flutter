import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/tCode_confirmation/tCodeConfirmation_viewModel.dart';
import '../component/dialogs/loading_dialog.dart';

class VerifyOtpView extends StatelessWidget {
  VerifyOtpView({super.key});

  late BuildContext _context;
  late VerifyOtpViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => VerifyOtpViewModel(),
        onViewModelReady: (viewModel) async {
          // get user details from cache
          await viewModel.getUserDetailsFromCache();
          viewModel.startTimer();
        },
        builder: (context, viewModel, index) {
          _context = context;
          _viewModel = viewModel;

          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.backgroundColor,
            appBar: AppBar(
              backgroundColor: ThemeColor.backgroundColor,
              leading: IconButton(
                  onPressed: () {
                    _pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ThemeColor.textfieldColor,
                  )),
            ),
            body: PopScope(
              canPop: false,
              onPopInvokedWithResult: (status, _) {
                if (!status) {
                  _pop();
                }
              },
              child: SafeArea(
                  child: Padding(
                padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: (MediaQuery.of(context).size.height / 50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 300,
                      child: Text(
                        "Now let's make you a TRAINR.",
                        style: TextStyle(
                            fontSize: 32,
                            color: ThemeColor.textfieldColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              'We\'ve sent you a code to ${viewModel.userDetails?.emailAddress}',
                              style: const TextStyle(
                                fontSize: 17,
                                color: ThemeColor.primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: GestureDetector(
                              onTap: () {
                                _pop();
                              },
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: ThemeColor.primaryColor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        pinTheme: PinTheme(
                            inactiveColor: ThemeColor.textfieldColor,
                            inactiveFillColor: ThemeColor.textfieldColor,
                            activeFillColor: ThemeColor.textfieldColor,
                            activeColor: ThemeColor.darkBackgroundColor,
                            selectedFillColor: ThemeColor.textfieldColor,
                            fieldHeight: 45),
                        keyboardType: TextInputType.number,
                        cursorColor: ThemeColor.darkBackgroundColor,
                        enableActiveFill: true,
                        textStyle: const TextStyle(
                            color: ThemeColor.darkBackgroundColor),
                        onChanged: (value) {
                          viewModel.pin = value;
                          print("otp: $value");
                        },
                      ),
                    ),
                    _timeLeft(viewModel),
                    _dontReceiveAnCode(),
                    Padding(
                      padding: const EdgeInsets.only(top: 65.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 200,
                          height: 47,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ThemeColor.textfieldColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () async {
                              bool errorCheck =
                                  viewModel.pin?.isNotEmpty ?? false;
                              if (errorCheck) {
                                _showLoader();

                                final response = await _viewModel.verifyOtp(
                                    viewModel.userDetails?.emailAddress ?? "",
                                    viewModel.pin ?? "");

                                Navigator.pop(_context);

                                if (response?.statuscode == 200) {
                                  _viewModel.navigateToChooseSpecialization();
                                } else {
                                  _showError(response?.message);
                                }
                              } else {
                                _showError("Please enter OTP");
                              }
                            },
                            child: const Text(
                              'Confirm',
                              style: TextStyle(
                                color: ThemeColor.backgroundColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
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

  Widget _timeLeft(VerifyOtpViewModel viewModel) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        "Time Left: ${viewModel.timeLeft ?? "05:00"}",
        style: const TextStyle(
            color: ThemeColor.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _dontReceiveAnCode() {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't receive an code?",
              style: TextStyle(
                  color: ThemeColor.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            GestureDetector(
              onTap: () async {
                if (_viewModel.timeLeft == "00:00") {
                  _showLoader();

                  final response = await _viewModel
                      .resendOtp(_viewModel.userDetails?.emailAddress ?? "");
                  Navigator.pop(_context);

                  if (response?.statuscode == 200) {
                    _viewModel.startTimer();
                  } else {
                    _showError(response?.message ?? "");
                  }
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Text(
                  "Resend",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: ThemeColor.primaryColor,
                      color: ThemeColor.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ));
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }

  void _pop() {
    if (_viewModel.from() == null) {
      if (Constants.keyFrom == "trainer") {
        _viewModel.navigateToRegistration();
      } else {
        _viewModel.navigateToClientRegistration();
      }
    } else {
      _viewModel.navigateToLogin();
    }
  }
}
