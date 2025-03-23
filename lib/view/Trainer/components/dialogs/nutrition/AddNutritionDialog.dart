import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import 'AddNutritionViewModel.dart';

class AddNutritionDialog extends StatelessWidget {
  final Function() onAddClick;

  const AddNutritionDialog({super.key, required this.onAddClick});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddNutritionViewModel(),
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
                          "Add Meal",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.sNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter meal name"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.quantityController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter quantity"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.calController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter calories"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.proteinController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter protein"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.carbController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter carbs"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.fatController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter fats"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () async {

                        },
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
