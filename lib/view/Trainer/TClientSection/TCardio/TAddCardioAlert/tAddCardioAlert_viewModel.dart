import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class TAddCardioAlertViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final cNameController = TextEditingController();
  final daysController = TextEditingController();
  final timeController = TextEditingController();
  final roundController = TextEditingController();
  final restController = TextEditingController();

  Widget btnEle = const Text(
    "Save",
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  );

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
    if (cNameController.value.text == null ||
        cNameController.value.text == '' ||
        daysController.value.text == null ||
        daysController.value.text == '' ||
        timeController.value.text == null ||
        timeController.value.text == '' ||
        restController.value.text == null ||
        restController.value.text == '' ||
        roundController.value.text == null ||
        roundController.value.text == '') {
      return false;
    } else {
      return true;
    }
  }

  navigateToClientSection() {
    _navigationService.navigateToTClientSectionView();
  }
}
