import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/customServices/trainerForm.dart';
import 'package:trainr/models/GetGenderResponse.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/Trainer/repo/TrainerRegistrationRepo.dart';

class TrainerRegistrationViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final form = locator<TrainerForm>();
  final _registrationRepo = locator<TrainerRegistrationRepo>();
  String formErrorMsg = '';

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNoController = TextEditingController();
  String? dob;
  final nationalityController = TextEditingController();
  final residenceController = TextEditingController();
  GenderData? genderInput;
  List<LanguageData?> languages = [];
  File? uploadedCertificate;
  File? uploadedNationalId;
  Map? _selectedLocation;

  bool isLoading = false;

  void showLoader() {
    isLoading = true;

    rebuildUi();
  }

  void hideLoader() {
    isLoading = false;
    rebuildUi();
  }

  uploadNationalId() async {
    var result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      uploadedNationalId = File(result.files.single.path ?? "");

      rebuildUi();
    }
  }

  uploadCertificates() async {
    var result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result != null) {
      uploadedCertificate = File(result.files.single.path ?? "");

      rebuildUi();
    }
  }

  bool validateData() {
    form.firstName = fNameController.value.text;
    form.lastName = lNameController.value.text;
    form.email = emailController.value.text;
    form.pass = passController.value.text;
    form.mobileNo = mobileNoController.value.text;
    form.dob = dob;
    form.gender = genderInput?.id;
    form.language = languages.map((lang) => lang?.id).join(",");
    form.nationality = nationalityController.value.text;
    form.residence = residenceController.value.text;
    form.certificates = uploadedCertificate;
    form.nationalCertificate = uploadedNationalId;
    form.selectedLocation = _selectedLocation;

    String? formCheck = form.validateForm();
    if (formCheck == null) {
      return true;
    } else {
      formErrorMsg = formCheck;
      print(formCheck);
      return false;
    }
  }

  Future<RegistrationResponse?> registerTrainer() async {
    return await _registrationRepo.registerTrainer(form);
  }

  Future<Response?> uploadCertificatesAndNationalCertificate(
      int trainerId) async {
    return await _registrationRepo.uploadCertificateAndNationalCertificate(
        form.email ?? "",
        form.certificates,
        form.nationalCertificate,
        "both",
        Constants.trainer,
        trainerId,
        0,
        0,
        0,
        1);
  }

  selectDate(DateTime? selectedDate) {
    dob = DateFormat('dd-MM-yy').format(selectedDate!);

    rebuildUi();
  }

  selectGender(GenderData gender) {
    genderInput = gender;

    rebuildUi();
  }

  selectLanguage(List<LanguageData> lang) {
    languages = lang;

    rebuildUi();
  }

  selectedGender() {
    return genderInput?.gender ?? "Gender";
  }

  selectedLang() {
    return languages.isEmpty
        ? "Languages"
        : languages.map((languages) => languages?.name).join(",");
  }

  navigateToRole() {
    navigationService.replaceWithRoleSelectView();
  }

  void setLocation(Map location) {
    _selectedLocation = location;
    rebuildUi();
  }

  navigateToOtp(RegistrationData? response) {
    MySharedPreferences.saveUser(response);
    navigationService.replaceWithTCodeConfirmationView();
  }

  selectedLocation() {
    return _selectedLocation?["locationName"] ?? null;
  }

  Future<GetGenderResponse?> getGenders() async {
    return await _registrationRepo.getGenders();
  }

  Future<GetLanguagesResponse?> getLanguages() async {
    return await _registrationRepo.getLanguages();
  }
}
