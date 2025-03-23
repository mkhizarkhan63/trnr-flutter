
import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class CProfileImageAlertViewmodel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  FilePickerResult? result;
  String fileName = "No file selected";

  bool isLoading = false;

  void navigateToClientProfileView() {
    navigationService.replaceWithClientProfileView();
  }

  filePakar(FilePickerResult data) {
    result = data;

    fileName = result!.files.first.name;

    rebuildUi();
  }

  showLoading() {
    isLoading = true;

    rebuildUi();
  }

  hideLoading() {
    isLoading = false;

    rebuildUi();
  }
}
