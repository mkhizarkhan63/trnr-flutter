import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/models/VerifyOtpResponse.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/Trainer/repo/VerifyOtpRepo.dart';

import '../../../customServices/socialLoginData.dart';

class VerifyOtpViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<VerifyOtpRepo>();
  final _socialLoginModel = locator<SocialLoginModel>();

  RegistrationData? userDetails;
  static const int _maxSeconds = 5 * 60;
  int _remainingSeconds = _maxSeconds;

  String? timeLeft;

  String? pin;

  String? from() {
    return _socialLoginModel.signInFrom;
  }

  void startTimer() {
    var interval = const Duration(seconds: 1);
    Timer.periodic(interval, (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        timeLeft =
            _remainingSeconds.toString().otpTimeFormat(_remainingSeconds);

        rebuildUi();
      } else {
        timer.cancel();
        timeLeft = "00:00";
        _remainingSeconds = _maxSeconds;
        rebuildUi();
      }
    });
  }

  Future<void> getUserDetailsFromCache() async {
    final data = await MySharedPreferences.getUser();
    userDetails = data;

    rebuildUi();
    print("cache data: $data");
  }

  Future<VerifyOtpResponse?>? verifyOtp(String emailAddress, String otp) async {
    return await _repo.verifyOtp(emailAddress, otp);
  }

  Future<VerifyOtpResponse?>? resendOtp(String emailAddress) async {
    return await _repo.resendOtp(emailAddress);
  }

  navigateToChooseSpecialization() {
    _navigationService.replaceWithTChooseSpecializationView();
  }

  navigateToRegistration() {
    _navigationService.replaceWithTrainerRegistrationView();
  }

  navigateToClientRegistration() {
    _navigationService.replaceWithRegistrationView();
  }

  navigateToLogin() {
    _navigationService.replaceWithLoginView();
  }
}
