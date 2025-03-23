import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../../models/LocationModel.dart';

class SearchLocationViewModel extends BaseViewModel {
  final searchController = TextEditingController();

  final locationList = [
    LocationModel(locationName: "Abu dhabi", isSelected: false),
    LocationModel(locationName: "Dubai", isSelected: false),
    LocationModel(locationName: "Sharjah", isSelected: false),
    LocationModel(locationName: "Ajman", isSelected: false),
    LocationModel(locationName: "Fujairah", isSelected: false),
    LocationModel(locationName: "Umm Al Quwain", isSelected: false),
    LocationModel(locationName: "Ras Al Khaimah", isSelected: false),
  ];

  void selectLocation(int index) {
    locationList[index].isSelected = !locationList[index].isSelected;

    rebuildUi();
  }
}
