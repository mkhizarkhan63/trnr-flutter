import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/models/FieldValidator.dart';


class AddSupplementViewModel extends BaseViewModel {

  final nameTextController = TextEditingController();
  final dosageTextController = TextEditingController();
  final timeTextController = TextEditingController();

  List<Map> supplementList = [];

  FieldValidator dataValidator() {
    FieldValidator fieldValidator;

    if (nameTextController.value.text == "" ||
        nameTextController.value.text == null) {
      fieldValidator = FieldValidator(false, "Enter supplement name");
    } else if (dosageTextController.value.text == "" ||
        dosageTextController.value.text == null) {
      fieldValidator = FieldValidator(false, "Enter dosage");
    } else if (timeTextController.value.text == "" ||
        timeTextController.value.text == null) {
      fieldValidator = FieldValidator(false, "Enter time");
    } else {
      fieldValidator = FieldValidator(true, "");
    }

    return fieldValidator;
  }

  void reload(){
    rebuildUi();
  }
}
