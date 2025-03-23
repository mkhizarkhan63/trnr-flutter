import 'package:stacked/stacked.dart';
import 'package:trainr/models/DataModel.dart';

import '../../../../../models/SalesData.dart';

class DataViewModel extends BaseViewModel {
  var data = [
    DataModel(
        "Daily Energy",
        false,
        true,
        [
          SalesData("2022", 67.40),
          SalesData("2023", 50.56),
          SalesData("2024", 80.41)
        ],
        [
          SalesData("2022", 33.40),
          SalesData("2023", 20.56),
          SalesData("2024", 10.41)
        ],
        ["24-07-2024", "25-07-2024"],
        ["Feb", "Mar"],
        34.3,
        23.6,
        34.6,
        31.2),
    DataModel(
        "Tiredness",
        false,
        true,
        [
          SalesData("2022", 10.40),
          SalesData("2023", 50.56),
          SalesData("2024", 70.41)
        ],
        [
          SalesData("2022", 13.40),
          SalesData("2023", 5.56),
          SalesData("2024", 2.41)
        ],
        ["24-07-2024", "25-07-2024"],
        ["Mar", "Apr"],
        32.3,
        25.6,
        31.6,
        20.2)
  ];

  void expand(int index) {
    data[index].isExpanded = !data[index].isExpanded;
    rebuildUi();
  }

  void nextDay(int index) {
    var counter = data[index].counter;
    if (data[index].isMonthView) {
      if (counter != data[index].months.length - 1) {
        counter++;
        data[index].counter = counter;
      }
    } else {
      if (counter != data[index].weekDays.length - 1) {
        counter++;
        data[index].counter = counter;
      }
    }

    rebuildUi();
  }

  void previousDay(int index) {
    var counter = data[index].counter;
    if (counter != 0) {
      counter--;
      data[index].counter = counter;
    } else {
      data[index].counter = 0;
    }

    rebuildUi();
  }

  void toggleMonthWeek(int index, bool status) {
    data[index].isMonthView = status;
    data[index].counter = 0;
    rebuildUi();
  }
}
