class ApiEndPoints {
  static const String appleSignInBaseUrl =
      "https://flutter-sign-in-with-apple-example.glitch.me/callbacks/";
  static const String signByAppleApi = "auth";
  static const String loginApi = "auth";
  static const String verifyOtpApi = "checkotp";
  static const String resendOtpApi = "resendotp";
  static const String getGenderApi = "getGender";
  static const String getLanguagesApi = "getLanguages";
  static const String getActivitiesApi = "getAllActivities";
  static const String getSessionsByUserApi = "getMySessionDetailsById";
  static const String bookSessionApi = "createBookingSession";
  static const String deleteSessionApi = "deleteSessionById";
  static const String createPaymentByStripeApi = "createPayment";
  static const String getSpecializationsApi = "getSpecializations";
  static const String getPersonalTrainingServicesApi =
      "getPersonalTrainingServices";
  static const String registrationApi = "registration";
  static const String updateTrainerProfileApi = "createOrUpdateTrainerProfile";
  static const String updateClientProfileApi = "createOrUpdateClientProfile";
  static const String getTrainerMediaApi =
      "getUserMediaByTrainerIdAndMediaType";
  static const String uploadCertificatesAndNationalIdApi = "uploadFile";
  static const String uploadTrainerMedia = "UploadTrainerMedia";
  static const String addUserSpecializationsApi = "createUserSpecialization";
  static const String addUserPersonalServicesApi =
      "createUserPersonalTrainingService";
  static const String getTrainerProfileById = "getProfileById";
  static const String getClientProfileById = "getClientProfileById";
  static const String deleteLanguageApi = "deleteUserLanguageByLanguageId";
  static const String deleteMedia = "deleteUserMediaByTrainerId";
  static const String deleteCertificateApi = "deleteCertificateByCertificateId";
  static const String addTrainerSpecializationsApi =
      "createTrainerSpecialization";
  static const String addTrainerServicesApi =
      "createTrainerPersonalTrainingService";

  static const String rateTrainerApi = "createRatingToTrainerByClientId";
  static const String createSessionsApi = "createSessions";
  static const String updateSessionsApi = "updateSessionById";
  static const String getTrainerReviewsApi = "getAllRatingsByTrainerId";
  static const String getAllSessionsApi = "getAllSessionDetailById";
  static const String getAllTrainersApi = "getAllTrainers";

  // shared preference keys
  static const String userKey = "user";
  static const String fcmTokenKey = "fcmToken";


}
