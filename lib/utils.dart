import 'dart:math';

import 'package:get_time_ago/get_time_ago.dart';

class Constants {
  static String keyFrom = "from";
  static String keyRegistration = "registration";
  static String keySocialLogin = "socialLogin";
  static int trainer = 1;
  static int client = 2;
  static int mediaTypePicture = 1;
  static int mediaTypeVideo = 2;
  static int mediaTypeAudio = 3;
  static String fromFb = "facebook";
  static String fromGoogle = "google";
  static String fromApple = "apple";
  static double radiusOfNearby = 15.0;

  static const String primaryChatNode = "primaryTrainerChat";
  static const String generalChatNode = "generaTrainerChat";
  static const String userDetailsNode = "userDetails";
  static const String messagesNode = "messages";
}

extension StringExtension on String {
  String otpTimeFormat(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$remainingSeconds";
  }

  String timeAgo(String timestamp) {
    var convertedTimestamp =
        DateTime.parse(timestamp); // Converting into [DateTime] object
    var result = GetTimeAgo.parse(convertedTimestamp);

    print("time ago: $result");

    return result;
  }
}

extension DoubleExtension on double {
  double calculateDistance(currentLat, currentLong, destLat, destLong) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((destLat - currentLat) * p) / 2 +
        c(currentLat * p) *
            c(destLat * p) *
            (1 - c((destLong - currentLong) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}
