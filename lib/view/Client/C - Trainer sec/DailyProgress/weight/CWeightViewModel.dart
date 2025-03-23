import 'package:stacked/stacked.dart';

class CWeightViewModel extends BaseViewModel {
  var isMonthView = true;

  var averageWeight = 77.24;
  var lastWeekWeight = 0.72;

  void toggleMonthWeek(bool status) {
    isMonthView = status;
    print(isMonthView);
    rebuildUi();
  }
}
