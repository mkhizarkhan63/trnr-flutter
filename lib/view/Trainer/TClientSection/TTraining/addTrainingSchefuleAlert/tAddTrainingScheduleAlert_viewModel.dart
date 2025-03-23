import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class TAddTrainingScheduleAlertViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final List<String> trainingTypes = [
    'Push',
    'Pull',
    "Legs",
    "Full Body",
  ];

  String trainingType = "non";
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
            Container() /*LoadingAnimationWidget.prograssiveDots(
        color: Colors.white,
        size: 50,
      ),*/
        );

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

  navigateToClientSection() {
    _navigationService.navigateToTClientSectionView();
  }
}
