import 'dart:io';

class TrainerForm {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? pass;
  String? email;
  String? dob;
  String? city;
  num? gender;
  String? language;
  String? nationality;
  String? residence;
  File? certificates;
  File? nationalCertificate;
  Map? selectedLocation;

  String? validateForm() {
    print(firstName);
    if (firstName == null || firstName == '') {
      return "Please enter first name!";
    } else {
      if (lastName == null || lastName == '') {
        return "Please enter last name!";
      } else {
        if (email == null || email == '') {
          return "Enter a valid email Address";
        } else {
          if (pass == null || pass == '') {
            return "Enter a valid password";
          } else {
            if (mobileNo == null || mobileNo == '') {
              return "Enter a valid mobile number!";
            } else {
              if (dob == null || dob == '') {
                return "Select a Date of Birth!";
              } else {
                if (gender == null || gender == '') {
                  return "Please select gender";
                } else {
                  if (nationality == null || nationality == '') {
                    return "Please enter a Nationality!";
                  } else {
                    if (residence == null || residence == '') {
                      return "Please enter a Residence!";
                    } else {
                      if (selectedLocation == null) {
                        return "Please select location!";
                      } else {
                        if (certificates == null) {
                          return "Please Upload certificate";
                        } else {
                          if (nationalCertificate == null) {
                            return "Please Upload national certificate";
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
    }
  }
}
