import 'package:stacked/stacked.dart';

class tTrainingViewModel extends BaseViewModel {
  bool _isEditable = false;

  void toggleEdit() {
    _isEditable = !_isEditable;

    rebuildUi();
  }

  isEditable() {
    return _isEditable;
  }
}
