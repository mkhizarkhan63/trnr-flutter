import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../assets/variables/themeColor.dart';
import '../../components/RowCGoals.dart';
import 'GoalsViewModel.dart';

class GoalsView extends StatelessWidget {
  const GoalsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryColor,
        body: SafeArea(
            child: ViewModelBuilder.reactive(
                viewModelBuilder: () => GoalsViewModel(),
                builder: (ctx, viewModel, index) {
                  return /*FutureBuilder(
                    future: viewModel.getTrainingData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back,
                                          color: ThemeColor.secondaryColor,
                                        ),
                                      ),
                                      Text(
                                        "${viewModel.trainerData.firstName} ${viewModel.trainerData.lastName}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: ThemeColor.secondaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Divider(color: ThemeColor.secondaryColor),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: ThemeColor.secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: const Center(
                                  child: Text(
                                    "Goals",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: ThemeColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.goals.length,
                                    itemBuilder: ((context, index) {
                                      final goals = snapshot.data!.goals[index];
                                      return RowCGoal(
                                          startDate: goals["startDate"],
                                          goalDetails: goals["goalDetails"],
                                          completionDate:
                                              goals["completionDate"]);
                                    }))),
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )*/
                      Container();
                })));
  }
}
