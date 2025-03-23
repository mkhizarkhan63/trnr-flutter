import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Trainer/TClientSection/TGoals/tGoals_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowGoals.dart';
import 'package:trainr/view/Trainer/components/dialogs/goals/AddGoalsDialog.dart';

import '../../../../assets/variables/themeColor.dart';

class TGoalsView extends StatelessWidget {
  const TGoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TGoalsViewModel(),
      builder: (context, TGoalsViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        Text(
                          "Client name",
                          style: const TextStyle(
                            fontSize: 20,
                            color: ThemeColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          viewModel.toggleEdit();
                        },
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: 16,
                              color: ThemeColor.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: ThemeColor.primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: ThemeColor.textfieldColor),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: ThemeColor.textfieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Center(
                    child: Text(
                      "Goals",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.backgroundColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return RowGoal(
                            startDate: "",
                            goalDetails: "",
                            completionDate: "",
                            isEditable: viewModel.isEditable(),
                            onDeleteClick: () async {});
                      }))),
              Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: ThemeColor.textfieldColor),
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.symmetric(vertical: 40),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return const AddGoalsDialog();
                        });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: ThemeColor.textfieldColor,
                  ),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
