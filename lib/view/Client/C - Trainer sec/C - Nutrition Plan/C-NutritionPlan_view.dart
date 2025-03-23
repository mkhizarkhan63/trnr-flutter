import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/C%20-%20Nutrition%20Plan/C-NutritionPlan_viewModel.dart';

import '../../components/RowCMeals.dart';

class CNutritionPlanView extends StatelessWidget {
  const CNutritionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CNutritionPlanViewModel(),
        builder: (context, CNutritionPlanViewModel viewModel, index) {
          /*return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
              child: FutureBuilder(
                future: viewModel.getTrainingData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (viewModel.training != null) {
                      Map? trainingTemp;
                      print(viewModel.training);
                      for (var training in viewModel.training!.nutiritionPlan) {
                        Timestamp timeStamp = training['date'];
                        if (timeStamp.toDate().day ==
                                viewModel.currentDate.day ||
                            timeStamp.toDate().month ==
                                viewModel.currentDate.month ||
                            timeStamp.toDate().year ==
                                viewModel.currentDate.year) {
                          trainingTemp = training;
                        }
                      }
                      return Wrap(
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
                          const Divider(
                            color: ThemeColor.secondaryColor,
                          ),
                          Builder(
                            builder: (context) {
                              if (trainingTemp != null) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.25,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, top: 8, bottom: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    ThemeColor.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.arrow_back_ios_new,
                                                  size: 18,
                                                  color:
                                                      ThemeColor.textfieldColor,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Today",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: ThemeColor
                                                        .secondaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              decoration: BoxDecoration(
                                                color:
                                                    ThemeColor.secondaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              padding: const EdgeInsets.all(5),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 18,
                                                  color:
                                                      ThemeColor.textfieldColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 30),
                                        padding: const EdgeInsets.all(10),
                                        child: Wrap(
                                          children: [
                                            Row(
                                              children: [
                                                const Text(
                                                  "Kcal :",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  " ${viewModel.getTotalCal(trainingTemp!['plans'])}g",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Protein:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  " ${viewModel.getTotalProtein(trainingTemp['plans'])}g",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Carb:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  " ${viewModel.getTotalcarb(trainingTemp!['plans'])}g",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text(
                                                  "Fat:",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  " ${viewModel.getTotalFat(trainingTemp!['plans'])}g",
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.brown,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount:
                                              (trainingTemp!['plans'] as List)
                                                  .length,
                                          itemBuilder: ((context, index) {
                                            final plan = trainingTemp!['plans'];
                                            print(plan);

                                            return RowCMeals(
                                                index: index + 1, plans: plan);
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 40.0),
                                    child: Text("No Nutrition Plans Available"),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text("something went wrong!"),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );*/
          return Container();
        });
  }
}
