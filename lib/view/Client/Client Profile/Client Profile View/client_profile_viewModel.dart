import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/view/Client/repo/ClientProfileRepo.dart';
import '../../../../models/GetClientProfileResponse.dart';

class ClientProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<ClientProfileRepo>();

  ClientData? clientData;

  Future<void> getClientProfile() async {
    final userData = await MySharedPreferences.getUser();

    if (userData != null) {
      final response = await _repo.getClientProfile(userData.clientId ?? 0);

      if (response?.data != null) {
        clientData = response?.data;
      }
    }

    rebuildUi();
  }

  uploadImage(FilePickerResult data) {
    rebuildUi();
  }

  void navigateToSettingView() {
    _navigationService.replaceWithSettingView();
  }

  navigateToClientHome() {
    _navigationService.replaceWithClientHomeView();
  }
}
