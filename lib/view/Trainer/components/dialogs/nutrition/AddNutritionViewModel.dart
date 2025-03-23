import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddNutritionViewModel extends BaseViewModel {
  final sNameController = TextEditingController();
  final quantityController = TextEditingController();
  final calController = TextEditingController();
  final fatController = TextEditingController();
  final proteinController = TextEditingController();
  final carbController = TextEditingController();
  List nutList = [];

  bool dataValidator() {
    if (sNameController.value.text == null ||
        sNameController.value.text == '' ||
        quantityController.value.text == null ||
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
}
