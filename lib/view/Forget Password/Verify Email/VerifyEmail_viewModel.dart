import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class VerifyEmailViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  String? pin;

  navigateToNewPassView() {
    navigationService.replaceWithNewPassView();
  }

  navigateToForgotPasswordView() {
    navigationService.replaceWithForgetPassView();
  }
}
