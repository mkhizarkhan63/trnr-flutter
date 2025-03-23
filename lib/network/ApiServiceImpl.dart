import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trainr/Client_services/ClientForm.dart';
import 'package:trainr/app/endpoints.dart';
import 'package:trainr/customServices/CreateSessionFrom.dart';
import 'package:trainr/customServices/FilterForm.dart';
import 'package:trainr/customServices/UpdateTrainerProfile.dart';
import 'package:trainr/customServices/socialLoginData.dart';
import 'package:trainr/customServices/trainerForm.dart';
import 'package:trainr/models/CreatePaymentByStripeResponse.dart';
import 'package:trainr/models/CreateTrainerSpecializationResponse.dart';
import 'package:trainr/models/GetActivitiesResponse.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';
import 'package:trainr/models/GetAllTrainersResponse.dart';
import 'package:trainr/models/GetAllTrainersResponse.dart';
import 'package:trainr/models/GetAllTrainersResponse.dart';
import 'package:trainr/models/GetClientProfileResponse.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/models/GetSessionByUserResponse.dart';
import 'package:trainr/models/GetTrainerMediaResponse.dart';
import 'package:trainr/models/GetTrainerProfileResponse.dart';
import 'package:trainr/models/GetTrainerReviewResponse.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';
import 'package:trainr/models/VerifyOtpResponse.dart';
import 'package:trainr/network/ApiService.dart';
import 'package:trainr/utils.dart';
import '../customServices/UpdateClientProfile.dart';
import '../models/CreateTrainerServicesResponse.dart';
import '../models/GetGenderResponse.dart';

class ApiServiceImpl {
  ApiServiceImpl._singleton();

  static final ApiServiceImpl instance = ApiServiceImpl._singleton();

  Future<Response?> signInByApple(
      AuthorizationCredentialAppleID credential) async {
    Response? response;

    try {
      response = await Dio(BaseOptions(
        validateStatus: (status) => status! < 500,
        // Allow 400 status for inspection,]
        baseUrl: ApiEndPoints.appleSignInBaseUrl,
      )).post(ApiEndPoints.signByAppleApi,
          data: {"token": credential.identityToken});

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<RegistrationResponse?> login(String email, String password) async {
    Response? response;

    try {
      response = await APIService.instance.request(
          ApiEndPoints.loginApi, DioMethod.post,
          param: {"emailAddress": email, "password": password},
          contentType: 'application/json');

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return RegistrationResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetGenderResponse?> getGender() async {
    try {
      final response = await APIService.instance
          .request(ApiEndPoints.getGenderApi, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetGenderResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetLanguagesResponse?> getLanguages() async {
    try {
      final response = await APIService.instance
          .request(ApiEndPoints.getLanguagesApi, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetLanguagesResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<SpecializationResponseModel?> getSpecializations() async {
    try {
      final response = await APIService.instance
          .request(ApiEndPoints.getSpecializationsApi, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return SpecializationResponseModel.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');
      return null;
    }
  }

  Future<PersonalTrainingServiceResponse?> getPersonalTrainingServices() async {
    try {
      final response = await APIService.instance
          .request(ApiEndPoints.getPersonalTrainingServicesApi, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return PersonalTrainingServiceResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');
      return null;
    }
  }

  Future<GetTrainerProfileResponse?> getTrainerProfileById(
      int trainerId) async {
    final data = {"trainerId": trainerId};
    try {
      final response = await APIService.instance.request(
          ApiEndPoints.getTrainerProfileById, DioMethod.get,
          param: data);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetTrainerProfileResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');
      return null;
    }
  }

  Future<RegistrationResponse?> registerTrainer(TrainerForm form) async {
    var data = {
      'firstName': form.firstName,
      'lastName': form.lastName,
      'mobileNumber': form.mobileNo,
      'DoB': form.dob,
      'nationality': form.nationality,
      'countryResidence': form.residence,
      'emailAddress': form.email,
      'password': form.pass,
      'genderId': form.gender.toString(),
      'typeId': Constants.trainer.toString(),
      'LanguagesIds': form.language,
      "location": form.selectedLocation
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.registrationApi, DioMethod.post,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return RegistrationResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<RegistrationResponse?> registerClient(ClientForm form) async {
    var data = {
      'firstName': form.firstName,
      'lastName': form.lastName,
      'mobileNumber': form.mobileNo,
      'DoB': form.dob,
      'nationality': form.nationality,
      'countryResidence': form.residence,
      'emailAddress': form.email,
      'password': form.pass,
      'genderId': form.gender.toString(),
      'typeId': Constants.client.toString(),
      'location': form.selectedLocation
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.registrationApi, DioMethod.post,
          param: data, contentType: 'application/json');

      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return RegistrationResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<RegistrationResponse?> registerSocialLoginTrainer(
      SocialLoginModel form) async {
    var data = {
      'firstName': form.userName,
      'lastName': "",
      'mobileNumber': form.userPhoneNumber,
      'DoB': "",
      'nationality': "",
      'countryResidence': "",
      'emailAddress': "",
      'password': "123456",
      'genderId': "",
      'typeId': Constants.trainer.toString(),
      'LanguagesIds': ""
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.registrationApi, DioMethod.post,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return RegistrationResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<RegistrationResponse?> registerSocialLoginClient(
      SocialLoginModel form) async {
    var data = {
      'firstName': form.userName,
      'lastName': "",
      'mobileNumber': form.userPhoneNumber,
      'DoB': "",
      'nationality': "",
      'countryResidence': "",
      'emailAddress': "",
      'password': "123456",
      'genderId': "",
      'typeId': Constants.client.toString()
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.registrationApi, DioMethod.post,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return RegistrationResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return RegistrationResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<CreateTrainerSpecializationResponse?> addUserSpecializations(
      num trainerId,
      int clientId,
      int typeId,
      List<num?> selectedSpecializations) async {
    var data = {
      "trainerId": trainerId,
      "clientId": clientId,
      "typeId": typeId,
      "specializationIds": selectedSpecializations
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.addUserSpecializationsApi, DioMethod.post,
          param: data, contentType: "application/json");

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return CreateTrainerSpecializationResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<CreateTrainerServicesResponse?> addUserPersonalServices(num trainerId,
      int clientId, int typeId, List<num?> selectedServices) async {
    var data = {
      "trainerId": trainerId,
      "clientId": clientId,
      "typeId": typeId,
      "personalTrainingServiceIds": selectedServices
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.addUserPersonalServicesApi, DioMethod.post,
          param: data, contentType: "application/json");

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return CreateTrainerServicesResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<VerifyOtpResponse?> verifyOtp(String emailAddress, String otp) async {
    var data = {"emailAddress": emailAddress, "otp": otp};

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.verifyOtpApi, DioMethod.post,
          param: data, contentType: "application/json");

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return VerifyOtpResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<VerifyOtpResponse?> resendOtp(String emailAddress) async {
    var data = {"emailAddress": emailAddress};

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.resendOtpApi, DioMethod.post,
          param: data, contentType: "application/json");

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return VerifyOtpResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return null;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> uploadCertificatesAndNationalId(
      String email,
      File? certificates,
      File? nationalCertificate,
      String fileType,
      int userType,
      int trainerId,
      int clientId,
      int certificateIds,
      int nationalCertificateId,
      int fileMode) async {
    var data = FormData.fromMap({
      "emailAddress": email,
      "fileType": fileType,
      "userType": userType,
      "trainerId": trainerId,
      "clientId": clientId,
      "certificatesIds": certificateIds,
      "nationalCertificateId": nationalCertificateId,
      "fileMode": fileMode,
    });

    if (certificates?.path!.isNotEmpty == true) {
      data.files.add(MapEntry(
          "certificates",
          await MultipartFile.fromFile(certificates?.path ?? "",
              filename: "${certificates?.path.split('/').last}",
              contentType: DioMediaType("image", "jpg"))));
    }

    if (nationalCertificate?.path!.isNotEmpty == true) {
      data.files.add(MapEntry(
          "nationalCertificate",
          await MultipartFile.fromFile(nationalCertificate?.path ?? "",
              filename: "${nationalCertificate?.path.split('/').last}",
              contentType: DioMediaType("image", "jpg"))));
    }

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.uploadCertificatesAndNationalIdApi, DioMethod.post,
          formData: data, contentType: 'multipart/form-data');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> deleteLanguage(
    int languageId,
  ) async {
    var data = {
      "languageId": languageId,
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.deleteLanguageApi, DioMethod.delete,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> deleteCertificate(
    int certificateId,
  ) async {
    var data = {
      "certificateId": certificateId,
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.deleteCertificateApi, DioMethod.delete,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> updateTrainerProfile(
      UpdateTrainerProfile profileData) async {
    var data = FormData.fromMap({
      "Id": profileData.trainerId,
      "firstName": profileData.firstName,
      "lastName": profileData.lastName,
      "emailAddress": profileData.email,
      "mobileNumber": profileData.mobileNo,
      "DoB": profileData.dob,
      "nationality": profileData.nationality,
      "countryResidence": profileData.residence,
      "genderId": profileData.genderId,
      "description": profileData.description,
      "typeId": Constants.trainer.toString(),
      "location": profileData.location,
      "personalTrainingServicesIds":
          profileData.selectedPersonalServices.join(","),
      "specializationsIds": profileData.selectedSpecialization.join(","),
      "languagesIds": profileData.selectedLanguages.join(","),
      "socialLinks": profileData.socialLinks.join(",")
    });

    if (profileData.profileImage?.path.isNotEmpty == true) {
      data.files.add(MapEntry(
          "profilePictures",
          await MultipartFile.fromFile(profileData.profileImage?.path ?? "",
              filename: "${profileData.profileImage?.path.split('/').last}",
              contentType: DioMediaType("image", "jpg"))));
    }

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.updateTrainerProfileApi, DioMethod.post,
          formData: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> updateClientProfile(UpdateClientProfile profileData) async {
    var data = FormData.fromMap({
      "Id": profileData.clientId,
      "FirstName": profileData.firstName,
      "LastName": profileData.lastName,
      "emailAddress": profileData.email,
      "MobileNumber": profileData.mobileNo,
      "DoB": profileData.dob,
      "Nationality": profileData.nationality,
      "CountryResidence": profileData.residence,
      "GenderId": profileData.genderId,
      "Description": profileData.description,
      "TypeId": Constants.client.toString(),
      "location": profileData.location,
      "PersonalTrainingServicesIds":
          profileData.selectedPersonalServices.join(","),
      "SpecializationsIds": profileData.selectedSpecialization.join(","),
    });

    if (profileData.profileImage?.path.isNotEmpty == true) {
      data.files.add(MapEntry(
          "profilePictures",
          await MultipartFile.fromFile(profileData.profileImage?.path ?? "",
              filename: "${profileData.profileImage?.path.split('/').last}",
              contentType: DioMediaType("image", "jpg"))));
    }

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.updateClientProfileApi, DioMethod.post,
          formData: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  /* mediaType ====> 1. picture, 2. video, 3. audio
   *
   * */
  Future<Response?> uploadTrainerMedia(String email, int mediaType,
      File? picture, File? video, File? audio, int trainerId) async {
    var data = FormData.fromMap({
      "emailAddress": email,
      "mediaType": mediaType,
      "trainerId": trainerId
    });

    if (picture?.path!.isNotEmpty == true) {
      data.files.add(MapEntry(
          "pictures",
          await MultipartFile.fromFile(picture?.path ?? "",
              filename: "${picture?.path.split('/').last}",
              contentType: DioMediaType("image", "jpg"))));
    }

    if (video?.path!.isNotEmpty == true) {
      data.files.add(MapEntry(
          "videos",
          await MultipartFile.fromFile(video?.path ?? "",
              filename: "${video?.path.split('/').last}",
              contentType: DioMediaType("video", "mp4"))));
    }

    if (audio?.path!.isNotEmpty == true) {
      data.files.add(MapEntry(
          "audios",
          await MultipartFile.fromFile(video?.path ?? "",
              filename: "${video?.path.split('/').last}",
              contentType: DioMediaType("audio", "mp3"))));
    }

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.uploadTrainerMedia, DioMethod.post,
          formData: data, contentType: 'multipart/form-data');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> deleteMedia(
    int trainerId,
    int mediaId,
    int mediaType,
  ) async {
    var data = {
      "trainerId": trainerId,
      "mediaType": mediaType,
      "mediaId": mediaId
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.deleteMedia, DioMethod.delete,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetTrainerMediaResponse?> getTrainerMedia(
      int trainerId, int mediaType) async {
    var data = {
      "trainerId": trainerId,
      "mediaType": mediaType,
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.getTrainerMediaApi, DioMethod.get,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetTrainerMediaResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return GetTrainerMediaResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> rateTrainer(
      int trainerId, int clientId, int rating, String comments) async {
    var data = {
      "ratings": rating,
      "reviews": comments,
      "clientId": clientId,
      "trainerId": trainerId
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.rateTrainerApi, DioMethod.post,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> createSessions(
      int typeId, int trainerId, int clientId, CreateSessionForm form) async {
    var data = {
      "title": form.title,
      "scheduledDate": form.scheduledDate,
      "scheduledTime": form.scheduledTime,
      "activityId": form.activityId,
      "totalCapacity": form.totalCapacity,
      "location": form.selectedLocation,
      "address": form.address,
      "classType": form.classType,
      "description": form.description,
      "price": form.price,
      "link": form.link,
      "TypeId": typeId,
      "ClientId": clientId,
      "TrainerId": trainerId
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.createSessionsApi, DioMethod.post,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> updateSessions(
      int typeId, int trainerId, int clientId, CreateSessionForm form) async {
    var data = {
      "Id": form.id,
      "title": form.title,
      "scheduledDate": form.scheduledDate,
      "scheduledTime": form.scheduledTime,
      "activityId": form.activityId,
      "totalCapacity": form.totalCapacity,
      "location": form.selectedLocation,
      "address": form.address,
      "classType": form.classType,
      "description": form.description,
      "price": form.price,
      "link": form.link,
      "TypeId": typeId,
      "ClientId": clientId,
      "TrainerId": trainerId
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.updateSessionsApi, DioMethod.post,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetTrainerReviewResponse?> getTrainerReviews(int trainerId) async {
    var data = {"trainerId": trainerId};

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.getTrainerReviewsApi, DioMethod.get,
          param: data, contentType: 'application/json');

      // Handle the response
      if (response.statusCode == 200) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetTrainerReviewResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: $response');
        return GetTrainerReviewResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetActivitiesResponse?> getActivities() async {
    try {
      final response = await APIService.instance
          .request(ApiEndPoints.getActivitiesApi, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetActivitiesResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return GetActivitiesResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetAllSessionResponse?> getAllSessions(
      String scheduleDate, FilterForm form) async {
    try {
      final data = {
        "classType": form.classTypes,
        "scheduledDate": scheduleDate,
        "price": form.pricing
      };

      final response = await APIService.instance
          .request(ApiEndPoints.getAllSessionsApi, param: data, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetAllSessionResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return GetAllSessionResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetSessionByUserResponse?> getSessionsByUser(
      int typeId, int trainerId, int clientId) async {
    final data = {
      "typeId": typeId,
      "trainerId": trainerId,
      "clientId": clientId
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.getSessionsByUserApi, param: data, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetSessionByUserResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return GetSessionByUserResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> bookSession(int sessionId, int clientId) async {
    final data = {"clientId": clientId, "sessionId": sessionId};

    try {
      final response = await APIService.instance
          .request(ApiEndPoints.bookSessionApi, param: data, DioMethod.post);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<Response?> deleteSession(int sessionId) async {
    final data = {"sessionId": sessionId};

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.deleteSessionApi, param: data, DioMethod.delete);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return response;
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return response;
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<CreatePaymentByStripeResponse?> createPaymentByStripe(
      String amount, String currency) async {
    final data = {
      'amount': amount,
      'currency': currency,
      'payment_method_types[]': 'card',
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.createPaymentByStripeApi, param: data, DioMethod.post);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return CreatePaymentByStripeResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return CreatePaymentByStripeResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetClientProfileResponse?> getClientProfile(int clientId) async {
    final data = {
      'clientId': clientId,
    };

    try {
      final response = await APIService.instance.request(
          ApiEndPoints.getClientProfileById, param: data, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetClientProfileResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return GetClientProfileResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  Future<GetAllTrainersResponse?> getAllTrainers() async {
    try {
      final response = await APIService.instance
          .request(ApiEndPoints.getAllTrainersApi, DioMethod.get);

      // Handle the response
      if (response != null) {
        // Success: Process the response data
        print('API call successful: ${response.data}');
        return GetAllTrainersResponse.fromJson(response.data);
      } else {
        // Error: Handle the error response
        print('API call failed: ${response.statusMessage}');
        return GetAllTrainersResponse.fromJson(response.data);
      }
    } catch (e) {
      // Error: Handle network errors
      print('Network error occurred: $e');

      return null;
    }
  }

  bool isValidFileFormat(File? file) {
    final fileName = file?.path.split('/').last.toLowerCase();
    return fileName!.endsWith('.jpg') || fileName!.endsWith('.jpeg');
  }
}
