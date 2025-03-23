import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/customServices/socialLoginData.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/view/repo/RoleRepo.dart';

import '../../cache/MySharedPreferences.dart';

class RoleSelectViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _socialLoginModel = locator<SocialLoginModel>();
  final _repo = locator<RoleRepo>();

  String? from() {
    return _socialLoginModel.signInFrom;
  }

  Future<RegistrationResponse?> trainerSocialLogin() async {
    return await _repo.trainerSocialLogin(_socialLoginModel);
  }

  Future<RegistrationResponse?> clientSocialLogin() async {
    return await _repo.clientSocialLogin(_socialLoginModel);
  }

  navigateToTRegistrationForm() {
    _navigationService.replaceWithTrainerRegistrationView();
  }

  navigateToChooseSpecialization() {
    _navigationService.replaceWithClientSpecializationView();
  }

  navigateToTChooseSpecialization() {
    _navigationService.replaceWithTChooseSpecializationView();
  }

  navigateToLogin() {
    _navigationService.replaceWithLoginView();
  }

  navigateToClientRegistration() {
    _navigationService.replaceWithRegistrationView();
  }

  navigateToOtp(RegistrationData? response) {
    MySharedPreferences.saveUser(response);
    _navigationService.replaceWithTCodeConfirmationView();
  }
}
