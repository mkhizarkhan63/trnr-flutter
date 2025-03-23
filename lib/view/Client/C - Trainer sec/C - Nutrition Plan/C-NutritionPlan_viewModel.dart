import 'package:stacked/stacked.dart';

class CNutritionPlanViewModel extends BaseViewModel {
  DateTime currentDate = DateTime.now();

  String getTotalCal(List dataList) {
    int totalCal = 0;

    for (var data in dataList) {
      totalCal = totalCal + int.parse((data['cal'] as String));
    }

    return totalCal.toString();
  }

  String getTotalProtein(List dataList) {
    int totalCal = 0;

    for (var data in dataList) {
      totalCal = totalCal + int.parse((data['protein'] as String));
    }

    return totalCal.toString();
  }

  String getTotalcarb(List dataList) {
    int totalCal = 0;

    for (var data in dataList) {
      totalCal = totalCal + int.parse((data['carb'] as String));
    }

    return totalCal.toString();
  }

  String getTotalFat(List dataList) {
    int totalCal = 0;

    for (var data in dataList) {
      totalCal = totalCal + int.parse((data['fat'] as String));
    }

    return totalCal.toString();
  }
}
