import 'package:stacked/stacked.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/customServices/FilterForm.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/models/LocationModel.dart';
import 'package:trainr/view/Client/repo/FilterRepo.dart';

class FilterViewModel extends BaseViewModel {
  final _repo = locator<FilterRepo>();
  final _filterForm = locator<FilterForm>();

  final List<LanguageData> languageList = [];

  final classTypeList = [
    LocationModel(locationName: "Male Only", isSelected: false),
    LocationModel(locationName: "Female Only", isSelected: false),
    LocationModel(locationName: "Mixed", isSelected: false),
  ];

  final pricingList = [
    LocationModel(locationName: "Free", isSelected: false),
    LocationModel(locationName: "Paid", isSelected: false)
  ];

  Future<void> getLanguagesList() async {
    final response = await _repo.getLanguages();

    if (response != null) {
      languageList.clear();
      languageList.addAll(response.data ?? []);
    }

    rebuildUi();
  }

  void setFilter() {
    _filterForm.pricing = pricingList
        .where((it) => it.isSelected)
        .map((it) => it.locationName.toLowerCase())
        .join(",");

    _filterForm.classTypes = classTypeList
        .where((it) => it.isSelected)
        .map((it) => it.locationName.replaceAll("Only", "").toLowerCase())
        .join(",");
  }

  void selectLanguages(int index) {
    languageList[index].isSelected = !languageList[index].isSelected;
    rebuildUi();
  }

  void selectClassTypes(int index) {
    classTypeList[index].isSelected = !classTypeList[index].isSelected;
    rebuildUi();
  }

  void selectPricing(int index) {
    pricingList[index].isSelected = !pricingList[index].isSelected;
    rebuildUi();
  }
}
