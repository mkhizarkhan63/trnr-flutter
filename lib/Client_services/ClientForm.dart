class ClientForm {
  String? firstName;
  String? lastName;
  String? email;
  String? pass;
  String? mobileNo;
  String? dob;
  String? city;
  String? nationality;
  String? residence;
  num? gender;
  Map? selectedLocation;

  var pinCode;

  List specialities = [];

  List<Map> services = [];

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
          if (pass == null || pass == '') {
            return "Enter a valid Password";
          } else {
            if (mobileNo == null || mobileNo == '') {
              return "Enter a valid Mobile No!";
            } else {
              if (dob == null || dob == '') {
                return "Select a Date of Birth!";
              } else {
                if (gender == null) {
                  return "Please select gender";
                } else {
                  if (nationality == null || nationality == '') {
                    return "Enter a Nationality!";
                  } else {
                    if (residence == null || residence == '') {
                      return "Enter a Residence!";
                    } else {
                      if (selectedLocation == null) {
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

  String? pinCheck() {
    if (pinCode == null || pinCode == '') {
      return "Enter the correct pin code!";
    } else {
      print("Success");
      return null;
    }
  }

  String? checkSpecialities() {
    if (specialities.length == 0 || specialities.length <= 0) {
      return "Please select atleast one specialization!";
    } else {
      return null;
    }
  }

  String? checkServices() {
    bool check = false;

    for (var service in services) {
      if (service["selected"] == true) {
        check = true;
      }
    }

    if (check == false) {
      return "Please select atleast one service!";
    } else {
      return null;
    }
  }
}
