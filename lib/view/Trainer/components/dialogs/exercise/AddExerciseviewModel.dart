import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class AddExerciseViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final List<String> trainingTypes = [
    'Push',
    'Pull',
    "Legs",
    "Full Body",
  ];

  String? trainingType;
  final eNameController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();
  final videoLinkController = TextEditingController();

  Widget btnEle = const Text(
    "Save",
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );

  showLoading() {
    btnEle = SizedBox(
        height: 50,
        child:
            Container()); /*LoadingAnimationWidget.prograssiveDots(
        color: Colors.white,
        size: 50,
      ),
    )*/

    rebuildUi();
  }

  hideLoading() {
    btnEle = const Text(
      "Save",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );

    rebuildUi();
  }

  bool dataValidator() {
    if (eNameController.value.text == null ||
        eNameController.value.text == '' ||
        setsController.value.text == null ||
        setsController.value.text == '' ||
        repsController.value.text == null ||
        repsController.value.text == '' ||
        videoLinkController.value.text == null ||
        videoLinkController.value.text == '') {
      return false;
    } else {
      return true;
    }
  }

  /*Future<String> addTrainingExercise() async {
    showLoading();
    if (dataValidator()) {
      if (trainingType == "non") {
        hideLoading();
        return Future.value("Please select a training type!");
      } else {
        Training? trainingData = await getTraining(
            trainerID: trainerData.id, clientID: clientData.id);
        switch (trainingType) {
          case "Push":
            if (trainingData == null) {
              trainingData!.trainingSchedule = {
                "Push": [
                  {
                    'name': eNameController.value.text,
                    'sets': setsController.value.text,
                    'reps': repsController.value.text,
                    'video': videoLinkController.value.text,
                  },
                ],
                "Pull": [],
                "Legs": [],
                "Full Body": [],
              };

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            } else {
              List tempList = trainingData!.trainingSchedule!['Push'];
              tempList.add(
                {
                  'name': eNameController.value.text,
                  'sets': setsController.value.text,
                  'reps': repsController.value.text,
                  'video': videoLinkController.value.text,
                },
              );
              trainingData!.trainingSchedule!['Push'] = tempList;

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            }
            break;
          case "Pull":
            if (trainingData!.trainingSchedule == null) {
              trainingData!.trainingSchedule = {
                "Push": [],
                "Pull": [
                  {
                    'name': eNameController.value.text,
                    'sets': setsController.value.text,
                    'reps': repsController.value.text,
                    'video': videoLinkController.value.text,
                  },
                ],
                "Legs": [],
                "Full Body": [],
              };

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            } else {
              List tempList = trainingData!.trainingSchedule!['Pull'];
              tempList.add(
                {
                  'name': eNameController.value.text,
                  'sets': setsController.value.text,
                  'reps': repsController.value.text,
                  'video': videoLinkController.value.text,
                },
              );
              trainingData!.trainingSchedule!['Pull'] = tempList;

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            }
            break;
          case "Legs":
            if (trainingData!.trainingSchedule == null) {
              trainingData!.trainingSchedule = {
                "Push": [],
                "Pull": [],
                "Legs": [
                  {
                    'name': eNameController.value.text,
                    'sets': setsController.value.text,
                    'reps': repsController.value.text,
                    'video': videoLinkController.value.text,
                  },
                ],
                "Full Body": [],
              };

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            } else {
              List tempList = trainingData!.trainingSchedule!['Legs'];
              tempList.add(
                {
                  'name': eNameController.value.text,
                  'sets': setsController.value.text,
                  'reps': repsController.value.text,
                  'video': videoLinkController.value.text,
                },
              );
              trainingData!.trainingSchedule!['Legs'] = tempList;

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            }
            break;
          case "Full Body":
            if (trainingData!.trainingSchedule == null) {
              trainingData!.trainingSchedule = {
                "Push": [],
                "Pull": [],
                "Legs": [],
                "Full Body": [
                  {
                    'name': eNameController.value.text,
                    'sets': setsController.value.text,
                    'reps': repsController.value.text,
                    'video': videoLinkController.value.text,
                  },
                ],
              };

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            } else {
              List tempList = trainingData!.trainingSchedule!['Full Body'];
              tempList.add(
                {
                  'name': eNameController.value.text,
                  'sets': setsController.value.text,
                  'reps': repsController.value.text,
                  'video': videoLinkController.value.text,
                },
              );
              trainingData!.trainingSchedule!['Full Body'] = tempList;

              Future<String> msg = updateTraining(training: trainingData);
              hideLoading();
              return msg;
            }
            break;
          default:
            hideLoading();
            return Future.value("Invalid training type!");
            break;
        }
      }
    } else {
      hideLoading();
      return Future.value("Invalid Input");
    }
  }*/

  navigateToClientSection() {
    _navigationService.navigateToTClientSectionView();
  }

  void setTrainingType(String type) {
    trainingType = type;

    rebuildUi();
  }

  selectedTrainingType() {
    return trainingType;
  }
}
