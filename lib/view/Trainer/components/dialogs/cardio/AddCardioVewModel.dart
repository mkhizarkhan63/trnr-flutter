import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/models/FieldValidator.dart';

class AddCardioViewModel extends BaseViewModel {
  final cNameController = TextEditingController();
  final daysController = TextEditingController();
  final timeController = TextEditingController();
  final minController = TextEditingController();
  final roundController = TextEditingController();
  final restController = TextEditingController();

  final durations = ["Minutes", "Hours"];

  String? _duration;

  void setDuration(String duration) {
    _duration = duration;

    rebuildUi();
  }

  FieldValidator dataValidator() {
    FieldValidator fieldValidator = FieldValidator(false, "All field required");
    if (cNameController.value.text == "" ||
        cNameController.value.text == null) {
      fieldValidator = FieldValidator(false, "Please enter cardio name");
    } else if (timeController.value.text == "" ||
        timeController.value.text == null) {
      fieldValidator = FieldValidator(false, "Please enter time");
    } else if (_duration == "" || _duration == null) {
      fieldValidator = FieldValidator(false, "Please select duration");
    } else if (roundController.value.text == "" ||
        roundController.value.text == null) {
      fieldValidator = FieldValidator(false, "Please enter rounds");
    } else if (restController.value.text == "" ||
        restController.value.text == null) {
      fieldValidator = FieldValidator(false, "Please enter rest");
    } else {
      fieldValidator = FieldValidator(true, "");
    }

    return fieldValidator;
  }

  selectedDuration() {
    return _duration;
  }
}
