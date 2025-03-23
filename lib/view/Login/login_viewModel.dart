import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/customServices/socialLoginData.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/utils.dart';
import '../repo/LoginRepo.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _loginRepo = locator<LoginRepo>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: "babar22@yopmail.com");
  final passController = TextEditingController(text: "123456");

  final _socialLoginModel = locator<SocialLoginModel>();

  Widget loginEle = const Text(
    'Login',
    style: TextStyle(
      color: ThemeColor.backgroundColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );
  String? msg;

  Future<RegistrationResponse?> login() async {
    final response =
        await _loginRepo.login(nameController.text, passController.text);
    await MySharedPreferences.saveUser(response?.data);
    print("login response: $response");

    return response;
  }

  Future<RegistrationResponse?> socialLogin() async {
    final response =
        await _loginRepo.login(_socialLoginModel.userEmail ?? "", "123456");

    if (response?.data != null) {
      await MySharedPreferences.saveUser(response?.data);
    }
    print("login response: $response");

    return response;
  }

  Future<bool> signInWithApple() async {
    final credential = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);

    // ignore: avoid_print
    print(credential);

    // This is the endpoint that will convert an authorization code obtained
    // via Sign in with Apple into a session in your system
    final session = await _loginRepo.signInByApple(credential);
    print(session);
    return false;
  }

  Future<bool> signInWithGoogle() async {
    // try {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print("google user : $googleUser");
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredentials =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final userName = userCredentials.user?.displayName;
    final email = userCredentials.user?.email;
    final phoneNumber = userCredentials.user?.phoneNumber;
    final signInFrom = Constants.fromGoogle;

    _socialLoginModel.userEmail = email;
    _socialLoginModel.userName = userName;
    _socialLoginModel.userPhoneNumber = phoneNumber;
    _socialLoginModel.signInFrom = signInFrom;
    return true;
  }

  Future<bool> signInWithFacebook() async {
    try {
      // Trigger the authentication flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      print("sign in Result : $loginResult");

      // Obtain the auth details from the request
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final userCredentials = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      final userName = userCredentials.user?.displayName;
      final email = userCredentials.user?.email;
      final phoneNumber = userCredentials.user?.phoneNumber;
      final signInFrom = Constants.fromFb;

      _socialLoginModel.userEmail = email;
      _socialLoginModel.userName = userName;
      _socialLoginModel.userPhoneNumber = phoneNumber;
      _socialLoginModel.signInFrom = signInFrom;
      return true;
      // Once signed in, return the UserCredential
    } on FirebaseAuthException catch (e) {
      print("Facebook sign in Error: ${e.message}");
      return false;
    } catch (e) {
      print("Something went wrong!");
      return false;
    }
  }

  navigateToRoleSelect() {
    _navigationService.navigateToRoleSelectView();
  }

  navigateToTrainerDashboard() {
    _navigationService.replaceWithTProfileView();
  }

  navigateToOtp() {
    _navigationService.replaceWithTCodeConfirmationView();
  }

  navigateToClientDashboard() {
    _navigationService.replaceWithClientHomeView();
  }

  navigateToForgetPassView() {
    _navigationService.replaceWithForgetPassView();
  }
}
