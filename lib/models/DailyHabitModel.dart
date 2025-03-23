

/// habitName : ""
/// values : ["1","2"]

class DailyHabitModel {
  DailyHabitModel({
    required String habitName,
    required List<String> values,
  }) {
    _habitName = habitName;
    _values = values;
  }

  DailyHabitModel.fromJson(dynamic json) {
    _habitName = json['habitName'];
    _values = json['values'] != null ? json['values'].cast<String>() : [];
  }

  String _habitName = "";
  List<String> _values = List.empty();

  DailyHabitModel copyWith({
    required String habitName,
    required List<String> values,
  }) =>
      DailyHabitModel(
        habitName: habitName,
        values: values,
      );

  String get habitName => _habitName;

  List<String> get values => _values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['habitName'] = _habitName;
    map['values'] = _values;
    return map;
  }
}
