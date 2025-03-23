import 'package:trainr/models/GetSessionByUserResponse.dart';

class CreateSessionForm {
  String? title;
  String? scheduledDate;
  String? scheduledTime;
  int? activityId;
  int? totalCapacity;
  Map? selectedLocation;
  String? address;
  String? classType;
  String? description;
  String price = "";
  String link = "";
  int? id;

  SessionData? sessionData;

  String validateData() {
    var message = "";

    if (title?.isEmpty == true) {
      message = "Please enter title";
    } else if (scheduledDate?.isEmpty == true) {
      message = "Please enter schedule date";
    } else if (scheduledTime?.isEmpty == true) {
      message = "Please enter schedule time";
    } else if (activityId == 0) {
      message = "Please select activity";
    } else if (totalCapacity == 0) {
      message = "Please select capacity";
    } else if (selectedLocation == null) {
      message = "Please select location";
    } else if (classType?.isEmpty == true) {
      message = "Please select class type";
    } else if (description?.isEmpty == true) {
      message = "Please enter description";
    } else {
      message = "";
    }

    return message;
  }
}
