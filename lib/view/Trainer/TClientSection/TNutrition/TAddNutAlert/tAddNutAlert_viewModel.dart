import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class TAddNutAlertViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  DateTime? nutDate;
  String? nutDateLabel;
  List nutList = [];

  final sNameController = TextEditingController();
  final quantityController = TextEditingController();
  final calController = TextEditingController();
  final fatController = TextEditingController();
  final proteinController = TextEditingController();
  final carbController = TextEditingController();

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
    if (sNameController.value.text == null ||
        sNameController.value.text == '' ||
        quantityController.value.text == null ||
        nutDate == null ||
        quantityController.value.text == '' ||
        carbController.value.text == null ||
        carbController.value.text == '' ||
        calController.value.text == null ||
        calController.value.text == '' ||
        proteinController.value.text == null ||
        proteinController.value.text == '' ||
        fatController.value.text == null ||
        fatController.value.text == '') {
      return false;
    } else {
      return true;
    }
  }

  addNutToList() {
    Map tempMap = {
      'date': Timestamp.fromDate(nutDate!),
      'name': sNameController.value.text,
      'quantity': quantityController.value.text,
      'cal': calController.value.text,
      'protein': proteinController.value.text,
      'carb': carbController.value.text,
      'fat': fatController.value.text,
    };

    nutList.add(tempMap);

    rebuildUi();
  }

  selectDate(DateTime? selectedDate) {
    nutDate = selectedDate;
    nutDateLabel = DateFormat('dd-MM-yy').format(nutDate!);

    rebuildUi();
  }

  Future<String> addSupplements() async {
    /*showLoading();
    if (dataValidator()) {
      Training? trainingData =
          await getTraining(trainerID: trainerData.id, clientID: clientData.id);
      if (trainingData!.nutiritionPlan.length == 0 ||
          trainingData!.nutiritionPlan.isEmpty) {
        trainingData!.nutiritionPlan = [
          {
            'date': Timestamp.fromDate(nutDate!),
            'plans': nutList,
          },
        ];

        Future<String> msg = updateTraining(training: trainingData);
        hideLoading();
        return msg;
      } else {
        Map<String, dynamic> tempMap = {
          'date': Timestamp.fromDate(nutDate!),
          'plans': nutList,
        };
        trainingData!.supplements.add(
          tempMap,
        );

        Future<String> msg = updateTraining(training: trainingData);
        hideLoading();
        return msg;
      }
    } else {
      hideLoading();
      return Future.value("Invalid Input");
    }*/

    return "";
  }

  navigateToClientSection() {
    _navigationService.navigateToTClientSectionView();
  }
}
