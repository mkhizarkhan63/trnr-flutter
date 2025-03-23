import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/RegistrationResponse.dart';

import '../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<RegistrationData?> getUserDetails() async {
    return await MySharedPreferences.getUser();
  }

  navigateToTrainerDashboard() {
    _navigationService.replaceWithTProfileView();
  }

  navigateToClientDashboard() {
    _navigationService.replaceWithClientHomeView();
  }

  navigateToLogin() {
    _navigationService.replaceWithLoginView();
  }
}
