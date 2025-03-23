

class RatingModel {
  int _value = 0;
  bool _isSelected = false;

  RatingModel({required int value,required bool isSelected}){
    _value=value;
    _isSelected=isSelected;
  }

  get value => _value;

  set value(value) {
    _value = value;
  }

  get isSelected => _isSelected;

  set isSelected(value) {
    _isSelected = value;
  }
}
