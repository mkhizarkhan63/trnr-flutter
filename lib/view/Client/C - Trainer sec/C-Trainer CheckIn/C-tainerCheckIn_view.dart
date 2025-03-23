import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/components/button.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/C-Trainer%20CheckIn/C-tarinerCheckIn_viewModel.dart';

class CTrainerCheckInView extends StatelessWidget {
  const CTrainerCheckInView({super.key});

  @override
  Widget build(BuildContext context) {
    const String role = "client";

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CTrainerCheckInViewModel(),
        builder: (context, CTrainerCheckInViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      Text(
                        "",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // viewModel.navigateToClientChatView();
                          viewModel.navigatetoClientChat();
                        },
                        icon: const Icon(Icons.message),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
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
                                  Border.all(color: ThemeColor.secondaryColor),
                            ),
                            child: const Center(
                              child: Text(
                                "Daily check In",
                                style: TextStyle(
                                    color: ThemeColor.secondaryColor,
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
                                  Border.all(color: ThemeColor.secondaryColor),
                            ),
                            child: const Center(
                              child: Text("Weekly check In",
                                  style: TextStyle(
                                      color: ThemeColor.secondaryColor,
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
                            viewModel.navigateToCTrainingSheduleView();
                          },
                          text: "Training Schedule"),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: MyButton(
                            role: role,
                            onTap: () {
                              viewModel.navigateToCNutritionPlanView();
                            },
                            text: "Nutrition Plan"),
                      ),
                      MyButton(
                          role: role,
                          onTap: () {
                            viewModel.navigateToClientCardioView();
                          },
                          text: "Cardio"),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: MyButton(
                            role: role,
                            onTap: () {
                              viewModel.navigateToClientSuplementView();
                            },
                            text: "Supplements"),
                      ),
                      MyButton(
                          role: role,
                          onTap: () {
                            viewModel.navigateToCGoalsView();
                          },
                          text: "Goals"),
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}
