import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Forget%20Password/Verify%20Email/VerifyEmail_viewModel.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => VerifyEmailViewModel(),
        builder: (context, VerifyEmailViewModel viewModel, index) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.backgroundColor,
            appBar: AppBar(
              backgroundColor: ThemeColor.backgroundColor,
              leading: IconButton(
                  onPressed: () {
                    viewModel.navigateToForgotPasswordView();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ThemeColor.textfieldColor,
                  )),
            ),
            body: SafeArea(
                child: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if (!status) {
                  viewModel.navigateToForgotPasswordView();
                }
              },
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
                        "Verify your email",
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
                          const Expanded(
                            child: Text(
                              'We\'ve sent you a code to example@mail.com',
                              style: TextStyle(
                                  fontSize: 17, color: ThemeColor.primaryColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.navigateToForgotPasswordView();
                              },
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                  color: ThemeColor.primaryColor,
                                  decorationColor: ThemeColor.primaryColor,
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
                            inactiveColor: Colors.black,
                            inactiveFillColor: ThemeColor.textfieldColor,
                            activeFillColor: ThemeColor.primaryColor,
                            activeColor: Colors.black,
                            selectedFillColor: ThemeColor.primaryColor,
                            fieldHeight: 45),
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.white,
                        enableActiveFill: true,
                        textStyle: TextStyle(color: Colors.black),
                        onCompleted: (String? value) {
                          print("value is $value");
                          viewModel.pin = value;
                        },
                      ),
                    ),
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
                            onPressed: () {
                              viewModel.navigateToNewPassView();
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
              ),
            )),
          );
        });
  }
}
