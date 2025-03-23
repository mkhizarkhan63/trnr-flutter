import 'package:dio/dio.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/network/ApiServiceImpl.dart';

class LoginRepo {
  Future<RegistrationResponse?> login(String email, String password) async {
    final response = await ApiServiceImpl.instance.login(email, password);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> signInByApple(
      AuthorizationCredentialAppleID credential) async {
    final response = await ApiServiceImpl.instance.signInByApple(credential);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
