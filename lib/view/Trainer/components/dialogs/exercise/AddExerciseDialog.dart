import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../bottomsheet/DropDownBottomSheet.dart';
import 'AddExerciseviewModel.dart';

class AddExerciseDialog extends StatelessWidget {
  const AddExerciseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddExerciseViewModel(),
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
                          "Add Exercise",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColor.textfieldColor,
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return DropDownBottomSheet(
                                      title: "Training Types",
                                      dataList: viewModel.trainingTypes,
                                      role: "Trainer",
                                      onItemClick: (type) {
                                        viewModel.setTrainingType(type);
                                      },
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel.selectedTrainingType() ??
                                      "Select Training Type",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColor.backgroundColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: ThemeColor.backgroundColor,
                          size: 25,
                        ),
                      ],
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
                        controller: viewModel.eNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter exercise name"),
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
                        controller: viewModel.setsController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter sets"),
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
                        controller: viewModel.repsController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter reps"),
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
                        controller: viewModel.videoLinkController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter video link"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () async {
                          /*String msg = await viewModel.addTrainingExercise();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text(msg),
                          )));
                          if (msg == "Success") {
                            viewModel.navigateToClientSection();
                          }*/
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
