import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.router.dart';

class NewPassViewModel extends BaseViewModel {
  final _navigationService = NavigationService();

  void navigateToLoginView() {
    _navigationService.replaceWithLoginView();
  }

  void navigateToVerifyEmailView() {
    _navigationService.replaceWithVerifyEmailView();
  }
}
