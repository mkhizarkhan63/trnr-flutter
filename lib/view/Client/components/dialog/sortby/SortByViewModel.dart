import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../../models/LocationModel.dart';

class SortByViewModel extends BaseViewModel {
  final searchController = TextEditingController();

  final sortByList = [
    LocationModel(locationName: "Newest to Oldest", isSelected: false),
    LocationModel(locationName: "Oldest to Newest", isSelected: false),
    LocationModel(locationName: "Rating (5 to 0)", isSelected: false),
    LocationModel(locationName: "Rating (0 to 5)", isSelected: false),
    LocationModel(locationName: "Most reviewed", isSelected: false)
  ];

  void selectOption(int index) {
    sortByList.forEach((item) {
      item.isSelected = false;
    });

    sortByList[index].isSelected = !sortByList[index].isSelected;

    rebuildUi();
  }
}
