import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/Client_services/ClientForm.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/view/Client/repo/ClientRegistrationRepo.dart';

import '../../../cache/MySharedPreferences.dart';
import '../../../models/GetGenderResponse.dart';
import '../../../models/RegistrationResponse.dart';

class RegistrationViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final form = locator<ClientForm>();
  final _registerRepo = locator<ClientRegistrationRepo>();
  String formErrorMsg = '';

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final mobileNoController = TextEditingController();
  final nationalityController = TextEditingController();
  final residenceController = TextEditingController();
  String? dob;
  GenderData? genderInput;
  Map? _selectedLocation;

  validateData() {
    form.firstName = firstNameController.value.text;
    print("the first name is ${firstNameController.value.text}");
    form.lastName = lastNameController.value.text;
    form.email = emailController.value.text;
    form.pass = passController.value.text;
    form.mobileNo = mobileNoController.value.text;
    form.nationality = nationalityController.value.text;
    form.residence = residenceController.value.text;
    form.dob = dob;
    form.gender = genderInput?.id;

    String? formCheck = form.validateForm();
    if (formCheck == null) {
      return true;
    } else {
      formErrorMsg = formCheck;
      return false;
    }
  }

  Future<RegistrationResponse?> registerClient() async {
    return await _registerRepo.registerClient(form);
  }

  selectGender(GenderData gender) {
    genderInput = gender;

    rebuildUi();
  }

  selectDate(DateTime? selectedDate) {
    dob = DateFormat('dd-MM-yy').format(selectedDate!);

    rebuildUi();
  }

  selectedGender() {
    return genderInput?.gender ?? "Gender";
  }

  void setLocation(Map location) {
    _selectedLocation = location;
    rebuildUi();
  }

  selectedLocation() {
    return _selectedLocation?["locationName"] ?? null;
  }

  void navigateToClientOtp(RegistrationData? data) {
    MySharedPreferences.saveUser(data);
    navigationService.replaceWithTCodeConfirmationView();
  }

  Future<GetGenderResponse?> getGenders() async {
    return await _registerRepo.getGenders();
  }

  navigateToRole() {
    navigationService.replaceWithRoleSelectView();
  }
}
