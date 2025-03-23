import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Forget%20Password/ForgetPass/ForgetPass_viewModel.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ForgetPassViewModel(),
        builder: (context, ForgetPassViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
                child: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if (!status) {
                  viewModel.navigateToFLoginView();
                }
              },
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              viewModel.navigateToFLoginView();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ThemeColor.textfieldColor,
                            ),
                          ),
                          const Text(
                            "Forget Password",
                            style: TextStyle(
                              fontSize: 20,
                              color: ThemeColor.textfieldColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80, left: 20),
                      child: const Text(
                        "Enter Email Address",
                        style: TextStyle(
                          fontSize: 18,
                          color: ThemeColor.textfieldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 0,
                          bottom: 0,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeColor.textfieldColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 150,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ThemeColor.primaryColor,
                              textStyle: const TextStyle(color: ThemeColor.backgroundColor),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {
                              viewModel.navigateToVerifyEmailView();
                            },
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                color: ThemeColor.backgroundColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 20),
                      child: TextButton(
                          onPressed: () {
                            viewModel.navigateToFLoginView();
                          },
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Back to Login",
                            style: TextStyle(
                                color: ThemeColor.textfieldColor,
                                fontSize: 18,
                                decorationColor: ThemeColor.textfieldColor,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600),
                          )),
                    )
                  ]),
            )),
          );
        });
  }
}
