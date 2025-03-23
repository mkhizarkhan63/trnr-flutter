import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/components/button.dart';
import 'package:trainr/view/Trainer/TClientSection/tClientSection_viewModel.dart';

class TClientSectionView extends StatelessWidget {
  const TClientSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    const String role = "trainer";
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TClientSectionViewModel(),
      builder: (context, TClientSectionViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: ThemeColor.textfieldColor,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "",
                          style: const TextStyle(
                            fontSize: 25,
                            color: ThemeColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          viewModel.navigatetoTChat();
                        },
                        icon: const Icon(
                          Icons.message,
                          color: ThemeColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: ThemeColor.textfieldColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.navigateToDailyCheckInView();
                          },
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeColor.primaryColor),
                            ),
                            child: const Center(
                              child: Text(
                                "Daily check In",
                                style: TextStyle(
                                    color: ThemeColor.primaryColor,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.navigateToWeeklyCheckInView();
                          },
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ThemeColor.primaryColor),
                            ),
                            child: const Center(
                              child: Text("Weekly check In",
                                  style: TextStyle(
                                      color: ThemeColor.primaryColor,
                                      fontSize: 14)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: MyButton(
                            role: role,
                            onTap: () {
                              viewModel.navigateToDailyProgressView();
                            },
                            text: "Daily Progress"),
                      ),
                      MyButton(
                          role: role,
                          onTap: () {
                            viewModel.navigateToTraining();
                          },
                          text: "Training Shedule"),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: MyButton(
                            role: role,
                            onTap: () {
                              viewModel.navigateToNutrition();
                            },
                            text: "Nutrition Plan"),
                      ),
                      MyButton(
                          role: role,
                          onTap: () {
                            viewModel.navigatetoTCardio();
                          },
                          text: "Cardio"),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: MyButton(
                            role: role,
                            onTap: () {
                              viewModel.navigateToSupplements();
                            },
                            text: "Supplements"),
                      ),
                      MyButton(
                          role: role,
                          onTap: () {
                            viewModel.navigateToTGoals();
                          },
                          text: "Goals"),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
