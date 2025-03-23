import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/components/dialogs/goals/AddGoalViewModel.dart';

class AddGoalsDialog extends StatelessWidget {
  const AddGoalsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddGoalViewModel(),
        builder: (ctx, viewModel, index) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.textfieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: ThemeColor.textfieldColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Add Goal",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ThemeColor.backgroundColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeColor.textfieldColor,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              viewModel.pickDate(context, true);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel.selectedStartDate() ??
                                      "Select Start Date",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColor.backgroundColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                        const Icon(
                          Icons.date_range_rounded,
                          color: ThemeColor.backgroundColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.goalDetailsTextController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter goal details"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ThemeColor.backgroundColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeColor.textfieldColor,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              viewModel.pickDate(context, false);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel.selectedCompletionDate() ??
                                      "Select Completion Date",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColor.backgroundColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                        const Icon(
                          Icons.date_range_rounded,
                          color: ThemeColor.backgroundColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Add",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeColor.textfieldColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
