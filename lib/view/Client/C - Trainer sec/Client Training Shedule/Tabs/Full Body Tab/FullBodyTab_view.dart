import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Training%20Shedule/Tabs/Full%20Body%20Tab/FullBodyTab_viewModel.dart';

import '../../../../../../assets/variables/themeColor.dart';
import '../../../../../Trainer/components/RowExerciseHeading.dart';
import '../../../../components/RowCExercise.dart';

class FullBodyTabView extends StatelessWidget {
  final String role = "client";

  const FullBodyTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => FullbodyTabViewModel(),
        builder: (context, FullbodyTabViewModel viewModel, index) {
          return /*FutureBuilder(
            future: viewModel.getTrainingData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List pushData = snapshot.data!.trainingSchedule!['Full Body'];
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      child: Row(
                        children: [
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
                              color: ThemeColor.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: pushData.length,
                            itemBuilder: (context, index) {
                              return RowCExercise(
                                  name: pushData[index]['name'],
                                  sets: pushData[index]['sets'],
                                  reps: pushData[index]['reps']);
                            }))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );*/
              Container();
        });
  }
}
