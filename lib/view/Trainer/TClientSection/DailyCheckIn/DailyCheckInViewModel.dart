import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/Client_services/DailyCheckInForm.dart';
import 'package:trainr/models/TirednessModel.dart';

import '../../../../app/app.locator.dart';

class DailyCheckInViewModel extends BaseViewModel {
  final amountOfFluidController = TextEditingController();
  final numberOfStepsController = TextEditingController();
  final weightController = TextEditingController();
  final hourOfSleepController = TextEditingController();
  final caloriesController = TextEditingController();
  final notesController = TextEditingController();

  final tirednessList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));
  final pressureList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));
  final strengthList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));
  final hungerList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));
  final recoveryList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));
  final dailyEnergyList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));
  final qualityOfSleepList = List<RatingModel>.generate(
      10, (index) => RatingModel(value: index + 1, isSelected: false));

  final form = locator<DailyCheckInForm>();

  String formErrorMsg = '';
  String? _date;
  int? _tiredness;
  int? _pressure;
  int? _strength;
  int? _hunger;
  int? _recovery;
  int? _dailyEnergy;
  int? _qualityOfSleep;

  bool submitForm() {
    form.date = _date;
    form.amountOfFluid = amountOfFluidController.text;
    form.numberOfSteps = numberOfStepsController.text;
    form.weight = weightController.text;
    form.tiredness = _tiredness;
    form.pressure = _pressure;
    form.strength = _strength;
    form.hunger = _hunger;
    form.recovery = _recovery;
    form.dailyEnergy = _dailyEnergy;
    form.qualityOfSleep = _qualityOfSleep;
    form.hoursOfSleep = hourOfSleepController.text;
    form.calories = caloriesController.text;
    form.notes = notesController.text;

    var message = form.validateData();
    print(message);

    if (message.isNotEmpty) {
      formErrorMsg = message;
      return false;
    } else {
      return true;
    }
  }

  void markTiredness(int index) {
    // unselect the selected value
    for (var data in tirednessList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      tirednessList[i].isSelected = true;
    }

    _tiredness = tirednessList[index].value;

    rebuildUi();
  }

  void markPressure(int index) {
    // unselect the selected value
    for (var data in pressureList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      pressureList[i].isSelected = true;
    }

    _pressure = pressureList[index].value;

    rebuildUi();
  }

  void markStrength(int index) {
    // unselect the selected value
    for (var data in strengthList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      strengthList[i].isSelected = true;
    }

    _strength = strengthList[index].value;

    rebuildUi();
  }

  void markHunger(int index) {
    // unselect the selected value
    for (var data in hungerList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      hungerList[i].isSelected = true;
    }

    _hunger = hungerList[index].value;

    rebuildUi();
  }

  void markRecovery(int index) {
    // unselect the selected value
    for (var data in recoveryList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      recoveryList[i].isSelected = true;
    }

    _recovery = recoveryList[index].value;

    rebuildUi();
  }

  void markDailyEnergy(int index) {
    // unselect the selected value
    for (var data in dailyEnergyList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      dailyEnergyList[i].isSelected = true;
    }

    _dailyEnergy = dailyEnergyList[index].value;

    rebuildUi();
  }

  void markQualityOfSleep(int index) {
    // unselect the selected value
    for (var data in qualityOfSleepList) {
      data.isSelected = false;
    }

    // mark selected  to index
    for (var i = 0; i <= index; i++) {
      qualityOfSleepList[i].isSelected = true;
    }

    _qualityOfSleep = qualityOfSleepList[index].value;

    rebuildUi();
  }

  Future<String> todaysDate() {
    _date = DateFormat('dd-MM-yy').format(DateTime.now());
    return Future.value(_date);
  }
}
