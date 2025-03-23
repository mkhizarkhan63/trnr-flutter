import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class TAddSuppAlertViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<Map> supplementList = [];

  final sNameController = TextEditingController();
  final dossageController = TextEditingController();
  final timeController = TextEditingController();

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

  addSuppToList() {
    Map tempMap = {
      'name': sNameController.value.text,
      'dossage': dossageController.value.text,
      'time': timeController.value.text,
    };

    supplementList.add(tempMap);

    rebuildUi();
  }

  bool dataValidator() {
    if (sNameController.value.text == null ||
        sNameController.value.text == '' ||
        dossageController.value.text == null ||
        dossageController.value.text == '' ||
        timeController.value.text == null ||
        timeController.value.text == '') {
      return false;
    } else {
      return true;
    }
  }

  navigateToClientSection() {
    _navigationService.navigateToTClientSectionView();
  }
}
