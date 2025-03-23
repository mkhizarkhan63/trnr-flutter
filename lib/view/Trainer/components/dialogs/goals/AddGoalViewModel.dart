import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import '../../../../../models/FieldValidator.dart';

class AddGoalViewModel extends BaseViewModel {
  final goalDetailsTextController = TextEditingController();
  String? _startDate, _completionDate;

  void pickDate(BuildContext context, bool isStartDate) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 + 5)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: ThemeColor.backgroundColor,
              onPrimary: ThemeColor.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (isStartDate) {
      _startDate = DateFormat('dd-MM-yy').format(selectedDate!);
    } else {
      _completionDate = DateFormat('dd-MM-yy').format(selectedDate!);
    }

    rebuildUi();
  }

  selectedStartDate() {
    return _startDate;
  }

  selectedCompletionDate() {
    return _completionDate;
  }

  FieldValidator dataValidator() {
    FieldValidator fieldValidator;

    if (_startDate == "" || _startDate == null) {
      fieldValidator = FieldValidator(false, "Select start date");
    } else if (goalDetailsTextController.value.text == "" ||
        goalDetailsTextController.value.text == null) {
      fieldValidator = FieldValidator(false, "Enter goal details");
    } else if (_completionDate == "" || _completionDate == null) {
      fieldValidator = FieldValidator(false, "Select completion date");
    } else {
      fieldValidator = FieldValidator(true, "");
    }

    return fieldValidator;
  }
}
