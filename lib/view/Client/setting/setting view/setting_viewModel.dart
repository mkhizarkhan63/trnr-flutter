import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/view/Client/setting/My%20information/information_vew.dart';
import 'package:trainr/view/Client/setting/Payment%20Method/payment%20Method%20Page1/PaymentPage1_view.dart';

class SettingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToProfile() {
    _navigationService.replaceWithClientProfileView();
  }

  void navigateToMyInformation() {
    _navigationService.navigateToView(InformationView());
  }

  void navigateTPaymentPage1() {
    _navigationService.navigateToView(const PaymentPage1View());
  }

  logout() {
    MySharedPreferences.clearPref();
    _navigationService.replaceWithLoginView();
  }
}
