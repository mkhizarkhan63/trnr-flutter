import 'package:stacked/stacked.dart';

import '../../../../../models/DailyHabitModel.dart';

class DailyHabitsViewModel extends BaseViewModel {
  var data = [
    DailyHabitModel(
        habitName: "Amount of fluids (Water & Drinks, Atleast 2 litres)",
        values: ["3", "2", "3", "4", "5", "6", "2"]),
    DailyHabitModel(
      habitName: "Number of steps",
      values: ["1000", "2000", "3000", "4000", "5000", "", "", ""],
    ),
    DailyHabitModel(
        habitName: "Weight", values: ["78.6", "76.3", "75.4", "", "", "", ""]),
    DailyHabitModel(
        habitName: "Tired", values: ["1", "2", "4", "", "", "", ""]),
    DailyHabitModel(
        habitName: "Pressure", values: ["1", "2", "3", "4", "5", "6", "7"])
  ];

  var _counter = 1;

  var comingWeek = [];
  var selectedDay = "";
  var lastDayOfWeek = "";

  DailyHabitsViewModel() {
    var currentDate =
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
    selectedDay = currentDate;
    var lastDate = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 6);

    lastDayOfWeek = "${lastDate.day}/${lastDate.month}/${lastDate.year}";

    comingWeek.add(currentDate);

    for (var index = DateTime.now().day; index < lastDate.day; index++) {
      var date = DateTime(DateTime.now().year, DateTime.now().month, index);
      var remainingDays = "${date.day}/${date.month}/${date.year}";
      comingWeek.add(remainingDays);
      print(date);
    }

    comingWeek.add(lastDayOfWeek);

    print(currentDate);
    print(lastDate);

    rebuildUi();
  }

  void nextDay() {
    if (_counter != comingWeek.length - 1) {
      _counter++;
      selectedDay = comingWeek[_counter];
    }

    rebuildUi();
  }

  void previousDay() {
    if (_counter != 0) {
      _counter--;
      selectedDay = comingWeek[_counter];
    } else {
      _counter = 1;
    }

    rebuildUi();
  }
}
