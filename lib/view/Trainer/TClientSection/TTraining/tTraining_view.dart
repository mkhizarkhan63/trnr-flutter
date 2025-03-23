import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TTraining/Tabs/Full%20Body%20Tab/FullBodyTab_view.dart';
import 'package:trainr/view/Trainer/TClientSection/TTraining/tTraining_viewModel.dart';
import 'package:trainr/view/Trainer/components/dialogs/exercise/AddExerciseDialog.dart';

class TTrainingView extends StatelessWidget {
  const TTrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => tTrainingViewModel(),
      builder: (context, tTrainingViewModel viewModel, index) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
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
                const Divider(
                  color: ThemeColor.textfieldColor,
                ),
                DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      const TabBar(
                        padding: EdgeInsets.all(0),
                        labelPadding: EdgeInsets.all(0),
                        indicatorColor: ThemeColor.primaryColor,
                        tabs: [
                          Text(
                            "Push",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor),
                          ),
                          Text(
                            "Pull",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor),
                          ),
                          Text(
                            "Legs",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor),
                          ),
                          Text(
                            "Full body",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor),
                          ),
                          // Icon(
                          //   Icons.edit,
                          //   size: 20,
                          //   color: Colors.black,
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: TabBarView(
                          children: [
                            TFullBodyTabView(
                                isEditable: viewModel.isEditable()),
                            TFullBodyTabView(
                                isEditable: viewModel.isEditable()),
                            TFullBodyTabView(
                                isEditable: viewModel.isEditable()),
                            TFullBodyTabView(
                                isEditable: viewModel.isEditable()),
                            /*  TPullTabView(isEditable: viewModel.isEditable()),
                            TLegTabView(isEditable: viewModel.isEditable()),
                            TFullBodyTabView(
                                isEditable: viewModel.isEditable()),*/
                            // PackagesTabView(),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: ThemeColor.textfieldColor),
                            borderRadius: BorderRadius.circular(5)),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return const AddExerciseDialog();
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
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
