

/// habitName : ""
/// values : ["1","2"]

class EvaluationModel {
  EvaluationModel({
    required String name,
    required List<String> values,
  }) {
    _name = name;
    _values = values;
  }

  EvaluationModel.fromJson(dynamic json) {
    _name = json['name'];
    _values = json['values'] != null ? json['values'].cast<String>() : [];
  }

  String _name = "";
  List<String> _values = List.empty();

  EvaluationModel copyWith({
    required String name,
    required List<String> values,
  }) =>
      EvaluationModel(
        name: name ?? _name,
        values: values ?? _values,
      );

  String get name => _name;

  List<String> get values => _values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['values'] = _values;
    return map;
  }
}
