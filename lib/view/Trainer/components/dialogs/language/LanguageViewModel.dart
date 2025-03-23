import 'package:stacked/stacked.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';

class LanguageViewModel extends BaseViewModel {
  List<LanguageData> _selectedLanguage = [];

  setLanguage(List<LanguageData> language) {
    _selectedLanguage = language;
    rebuildUi();
  }

  List<LanguageData> selectedLang() {
    return _selectedLanguage;
  }
}
