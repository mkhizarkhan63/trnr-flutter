import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/GetActivitiesResponse.dart';
import 'package:trainr/models/GetClientProfileResponse.dart';
import 'package:trainr/models/GetGenderResponse.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/models/GetSessionByUserResponse.dart';
import 'package:trainr/models/GetTrainerMediaResponse.dart';
import 'package:trainr/models/GetTrainerReviewResponse.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

import '../../customServices/CreateSessionFrom.dart';
import '../../customServices/UpdateTrainerProfile.dart';
import '../../models/CreatePaymentByStripeResponse.dart';
import '../../models/GetTrainerProfileResponse.dart';
import '../../network/ApiServiceImpl.dart';

class BaseRepo {
  Future<GetGenderResponse?> getGenders() async {
    final response = await ApiServiceImpl.instance.getGender();

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<GetLanguagesResponse?> getLanguages() async {
    final response = await ApiServiceImpl.instance.getLanguages();

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<SpecializationResponseModel?> getSpecializations() async {
    final response = await ApiServiceImpl.instance.getSpecializations();

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<PersonalTrainingServiceResponse?> getPersonalTrainingServices() async {
    final response =
        await ApiServiceImpl.instance.getPersonalTrainingServices();

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      final currentGoogleUser = FirebaseAuth.instance.currentUser;
      // sign out by google
      if (currentGoogleUser != null) {
        await GoogleSignIn().signOut();

        return true;
      } else {
        final currentFacebookUser = FirebaseAuth.instance.currentUser;

        if (currentFacebookUser != null) {
          await FacebookAuth.instance.logOut();
          return true;
        } else {
          return true;
        }
        // clear cache data
        return true;
      }
    } on Exception catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<GetTrainerProfileResponse?> getTrainerProfileById(
      int trainerId) async {
    final response =
        await ApiServiceImpl.instance.getTrainerProfileById(trainerId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  /* Note
   * fileType ===> fixed: nationalcertificate,certificates,both
   * UserType ==> 1(Trainer),2(Client)
   * TrainerId ===> If  usertype 1 so trainerId must be provided
   * ClientId ===> If  usertype 2 so clientId must be provided (if you select clientId so its email must be provided but can not pass trainerId at same time )
   * certificatesIds ==> Certificates depends on fileType, what you select? If CertificatesIds is 0 so I will create file you otherwise will update
   * nationalCertificateId ===> NationalCertificate depends on fileType, what you select? If nationalCertificateId is 0 so it will create a file for you otherwise Update
   *  file mode ===> Must be sent create: 1 and Update: 2
   * */
  Future<Response?> uploadCertificateAndNationalCertificate(
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
    final response = await ApiServiceImpl.instance
        .uploadCertificatesAndNationalId(
            email,
            certificates,
            nationalCertificate,
            fileType,
            userType,
            trainerId,
            clientId,
            certificateIds,
            nationalCertificateId,
            fileMode);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> updateTrainerProfile(
      UpdateTrainerProfile profileData) async {
    final response =
        await ApiServiceImpl.instance.updateTrainerProfile(profileData);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> uploadTrainerMedia(String email, int mediaType,
      File? picture, File? video, File? audio, int trainerId) async {
    final response = await ApiServiceImpl.instance
        .uploadTrainerMedia(email, mediaType, picture, video, audio, trainerId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<GetTrainerMediaResponse?> getTrainerMedia(
      int trainerId, int mediaType) async {
    final response =
        await ApiServiceImpl.instance.getTrainerMedia(trainerId, mediaType);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<GetTrainerReviewResponse?> getTrainerReviews(int trainerId) async {
    final response = await ApiServiceImpl.instance.getTrainerReviews(trainerId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<GetActivitiesResponse?> getActivities() async {
    final response = await ApiServiceImpl.instance.getActivities();

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> createSessions(
      int typeId, int trainerId, int clientId, CreateSessionForm form) async {
    final response = await ApiServiceImpl.instance
        .createSessions(typeId, trainerId, clientId, form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> updateSessions(
      int typeId, int trainerId, int clientId, CreateSessionForm form) async {
    final response = await ApiServiceImpl.instance
        .updateSessions(typeId, trainerId, clientId, form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<GetSessionByUserResponse?> getSessionsByUser(
      int typeId, int trainerId, int clientId) async {
    final response = await ApiServiceImpl.instance
        .getSessionsByUser(typeId, trainerId, clientId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> deleteSession(int sessionId) async {
    final response = await ApiServiceImpl.instance.deleteSession(sessionId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<CreatePaymentByStripeResponse?> createPaymentByStripe(
      String amount, String currency) async {
    final response =
        await ApiServiceImpl.instance.createPaymentByStripe(amount, currency);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<GetClientProfileResponse?> getClientProfile(int clientId) async {
    final response = await ApiServiceImpl.instance.getClientProfile(clientId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<void> getFirebaseToken() async {
    if (Platform.isIOS) {
      final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      if (apnsToken != null && apnsToken != "") {
        // APNS token is available, make FCM plugin API requests...
        print("fcm token: $apnsToken");
        await MySharedPreferences.saveFcmToken(apnsToken);
      }
    } else {
      final fcmToken = await FirebaseMessaging.instance.getToken();

      if (fcmToken != null && fcmToken != "") {
        print("fcm token: $fcmToken");
        await MySharedPreferences.saveFcmToken(fcmToken);
      }
    }
  }
}
