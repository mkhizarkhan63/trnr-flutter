import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/models/FieldValidator.dart';

class PackageViewModel extends BaseViewModel {
  String? _selectedSubsType;
  final subscriptionList = ["Monthly", "Sessions"];

  final priceController = TextEditingController();
  final capacityController = TextEditingController();

  final monthsList = List.generate(12, (index) => "${index + 1} month");
  final sessionsList = List.generate(40, (index) => "${index + 1} session");

  String? _subscriptionLimit;

  FieldValidator isDataValid() {
    FieldValidator fieldValidator;

    if (_selectedSubsType == null) {
      fieldValidator = FieldValidator(false, "Please select subscription type");
    } else if (_subscriptionLimit == null) {
      fieldValidator =
          FieldValidator(false, "Please select subscription limit");
    } else if (capacityController.value.text == null ||
        capacityController.value.text.isEmpty) {
      fieldValidator = FieldValidator(false, "Please enter capacity");
    } else if (priceController.value.text == null ||
        priceController.value.text.isEmpty) {
      fieldValidator = FieldValidator(false, "Please enter price");
    } else {
      fieldValidator = FieldValidator(true, "");
    }

    return fieldValidator;
  }

  Future<String> addPackage() async {
    final packageList = [];
    String? capacity = capacityController.value.text;
    String? price = priceController.value.text;

    return "";
  }

  setType(String type) {
    _selectedSubsType = type;
    rebuildUi();
  }

  setLimit(String? limit) {
    _subscriptionLimit = limit;
    rebuildUi();
  }

  selectedType() {
    return _selectedSubsType;
  }

  selectedLimit() {
    return _subscriptionLimit;
  }
}
