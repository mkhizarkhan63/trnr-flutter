import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../bottomsheet/DropDownBottomSheet.dart';
import 'AddCardioVewModel.dart';

class AddCardioDialog extends StatelessWidget {
  const AddCardioDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddCardioViewModel(),
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
                          "Add Cardio",
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
                        controller: viewModel.cNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter cardio name"),
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
                        controller: viewModel.timeController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter time"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
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
                                      title: "Duration",
                                      dataList: viewModel.durations,
                                      role: "Trainer",
                                      onItemClick: (type) {
                                        viewModel.setDuration(type);
                                      },
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel.selectedDuration() ??
                                      "Select Duration",
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
                        controller: viewModel.roundController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter rounds"),
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
                        controller: viewModel.restController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Enter rest"),
                      ),
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
