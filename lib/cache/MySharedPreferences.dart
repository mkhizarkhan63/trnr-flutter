import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainr/app/endpoints.dart';
import 'package:trainr/models/RegistrationResponse.dart';

class MySharedPreferences {
  static Future<void> saveUser(RegistrationData? response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(response?.toJson());
    await prefs.setString(ApiEndPoints.userKey, json);

    print("user response: $json");
  }

  static Future<void> saveFcmToken(String fcmToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(ApiEndPoints.fcmTokenKey, fcmToken);

    print("user response: $json");
  }

  static Future<RegistrationData?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(ApiEndPoints.userKey);
    print("data: $data");
    if (data != null) {
      final userJson = jsonDecode(data ?? "");
      print("user json: $userJson");
      if (userJson!=null) {
        return RegistrationData.fromJson(userJson);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<String?> getFcmToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(ApiEndPoints.fcmTokenKey);
    print("data: $data");
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  static Future<void> clearPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
