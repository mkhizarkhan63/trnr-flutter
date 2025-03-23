import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Forget%20Password/New%20Password/NewPass_viewModel.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NewPassViewModel(),
        builder: (context, NewPassViewModel viewModel, index) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.backgroundColor,
            body: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if (!status) {
                  viewModel.navigateToVerifyEmailView();
                }
              },
              child: SafeArea(
                  child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Text(
                    "New Password",
                    style: TextStyle(
                      fontSize: 25,
                      color: ThemeColor.textfieldColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter new Password",
                        style: TextStyle(
                          fontSize: 18,
                          color: ThemeColor.textfieldColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 0,
                          bottom: 0,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeColor.textfieldColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'New Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "Enter confirm password",
                          style: TextStyle(
                            fontSize: 18,
                            color: ThemeColor.textfieldColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 0,
                          bottom: 0,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeColor.textfieldColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 150,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ThemeColor.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {
                                viewModel.navigateToLoginView();
                              },
                              child: const Text(
                                'Confirm',
                                style: TextStyle(
                                  color: ThemeColor.backgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ])),
            ),
          );
        });
  }
}
