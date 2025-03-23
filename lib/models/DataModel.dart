import 'SalesData.dart';

class DataModel {
  String? _title;
  bool _isExpanded = false;
  bool _isMonthView = true;
  var _monthData = <SalesData>[];
  var _weekData = <SalesData>[];
  var _weekDays = <String>[];
  var _months = <String>[];
  double? _avgWeekValue;
  double? _lastWeekValue;
  double? _avgMonthValue;
  double? _lastMonthValue;
  int counter = 0;

  DataModel(
      this._title,
      this._isExpanded,
      this._isMonthView,
      this._monthData,
      this._weekData,
      this._weekDays,
      this._months,
      this._avgWeekValue,
      this._lastWeekValue,
      this._avgMonthValue,
      this._lastMonthValue);

  String? get title => _title;

  bool get isExpanded => _isExpanded;

  double? get lastMonthValue => _lastMonthValue;

  double? get avgMonthValue => _avgMonthValue;

  double? get lastWeekValue => _lastWeekValue;

  double? get avgWeekValue => _avgWeekValue;

  get months => _months;

  get weekDays => _weekDays;

  get weekData => _weekData;

  get monthData => _monthData;

  bool get isMonthView => _isMonthView;

  set isMonthView(bool value) {
    _isMonthView = value;
  }

  set isExpanded(bool value) {
    _isExpanded = value;
  }
}
