import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Trainer/TClientSection/TTraining/Tabs/Full%20Body%20Tab/FullBodyTab_viewModel.dart';

import '../../../../../../assets/variables/themeColor.dart';
import '../../../../components/RowExercise.dart';
import '../../../../components/RowExerciseHeading.dart';

class TFullBodyTabView extends StatelessWidget {
  final bool isEditable;
  final String role = "trainer";

  const TFullBodyTabView({super.key, required this.isEditable});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TFullbodyTabViewModel(),
        builder: (context, TFullbodyTabViewModel viewModel, index) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Row(
                  children: [
                    isEditable
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(
                              Icons.delete,
                              color: ThemeColor.textfieldColor,
                            ),
                          )
                        : Container(),
                    RowExerciseHeading(
                      heading: "Exercise",
                      role: role,
                    ),
                    RowExerciseHeading(heading: "Sets", role: role),
                    RowExerciseHeading(heading: "Reps", role: role),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(
                        Icons.videocam_rounded,
                        color: ThemeColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return RowExercise(
                            name: "",
                            sets: "",
                            reps: "",
                            isEditable: isEditable,
                            onDeleteClick: () async {});
                      }))
            ],
          );
        });
  }
}
