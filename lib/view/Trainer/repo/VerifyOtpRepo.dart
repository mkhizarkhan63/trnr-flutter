import '../../../models/VerifyOtpResponse.dart';
import '../../../network/ApiServiceImpl.dart';

class VerifyOtpRepo {
  Future<VerifyOtpResponse?> verifyOtp(String emailAddress, String otp) async {
    final response = await ApiServiceImpl.instance.verifyOtp(emailAddress, otp);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<VerifyOtpResponse?> resendOtp(String emailAddress) async {
    final response = await ApiServiceImpl.instance.resendOtp(emailAddress);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
