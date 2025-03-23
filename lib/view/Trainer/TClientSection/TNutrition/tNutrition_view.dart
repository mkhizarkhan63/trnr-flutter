import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TNutrition/tNutrition_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowMeals.dart';
import 'package:trainr/view/Trainer/components/dialogs/DeleteMealDialog.dart';
import 'package:trainr/view/Trainer/components/dialogs/nutrition/AddNutritionDialog.dart';

class TNutritionView extends StatelessWidget {
  const TNutritionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TNutritionViewModel(),
      builder: (context, TNutritionViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Wrap(
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
                const Divider(
                  color: ThemeColor.primaryColor,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.25,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ThemeColor.primaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 10),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18,
                                  color: ThemeColor.backgroundColor,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ThemeColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                color: ThemeColor.primaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: ThemeColor.backgroundColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "g",
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  " }g",
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "g",
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
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "g",
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
                          itemCount: 1,
                          itemBuilder: ((context, index) {
                            return RowMeals(
                                index: index + 1,
                                plans: [],
                                isEditable: viewModel.isEditable(),
                                onDeleteClick: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return DeleteMealDialog(
                                            mealName: "Meal ${index + 1}",
                                            onYesClick: () async {});
                                      });
                                });
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  alignment: Alignment.center,
                  child: Container(
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
                              return AddNutritionDialog(onAddClick: () {});
                            });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                        color: ThemeColor.textfieldColor,
                      ),
                    ),
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
