import '../../customServices/socialLoginData.dart';
import '../../models/RegistrationResponse.dart';
import '../../network/ApiServiceImpl.dart';

class RoleRepo {
  Future<RegistrationResponse?> trainerSocialLogin(
      SocialLoginModel form) async {
    final response =
        await ApiServiceImpl.instance.registerSocialLoginTrainer(form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<RegistrationResponse?> clientSocialLogin(SocialLoginModel form) async {
    final response =
        await ApiServiceImpl.instance.registerSocialLoginClient(form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
