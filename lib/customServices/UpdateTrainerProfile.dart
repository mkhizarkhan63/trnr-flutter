import 'dart:io';

import 'package:trainr/models/GetAllSessionResponse.dart';

import '../models/GetTrainerProfileResponse.dart';

class UpdateTrainerProfile {
  int? trainerId;
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? pass;
  String? email;
  String? dob;
  String? description;
  int? genderId;
  String? nationality;
  String? residence;
  LocationData? location;
  List<int> selectedSpecialization = [];
  List<int> selectedPersonalServices = [];
  List<int> selectedLanguages = [];
  List<dynamic> socialLinks = [];
  File? profileImage;

  String? validateForm() {
    print(firstName);
    if (firstName == null || firstName == '') {
      return "Please enter first name";
    } else {
      if (lastName == null || lastName == '') {
        return "Please enter last name";
      } else {
        if (email == null || email == '') {
          return "Enter a valid Email Address";
        } else {
          if (mobileNo == null || mobileNo == '') {
            return "Enter a valid Mobile No!";
          } else {
            if (dob == null || dob == '') {
              return "Select a Date of Birth!";
            } else {
              if (genderId == null) {
                return "Please select gender";
              } else {
                if (nationality == null || nationality == '') {
                  return "Enter a Nationality!";
                } else {
                  if (residence == null || residence == '') {
                    return "Enter a Residence!";
                  } else {
                    if (location == null) {
                      return "Please select location!";
                    } else {
                      return null;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
