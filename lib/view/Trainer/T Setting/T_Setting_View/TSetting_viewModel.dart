import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';

class TSettingViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  navigateToTMyInformationView() {
    navigationService.navigateToTMyInformationView();
  }

  navigateToTTPaymentpage1view() {
    navigationService.navigateToTPaymentPage1View();
  }

  logout() {
    MySharedPreferences.clearPref();
    navigationService.replaceWithLoginView();
  }

  navigateToHome() {
    navigationService.replaceWithTProfileView();
  }
}
