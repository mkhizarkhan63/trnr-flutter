import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/customServices/UpdateTrainerProfile.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/utils.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../models/GetTrainerProfileResponse.dart';
import '../../../repo/TrainerDashboardRepo.dart';

class ProfileTabViewModel extends BaseViewModel {
  FilePickerResult? result;
  final _repo = locator<TrainerDashboardRepo>();
  String fileName = "No file selected";
  List<LanguageData> languages = [];
  List<String> socialLinks = [];

  final descriptionController = TextEditingController(text: "");

  bool _toggleEditCertificate = false;
  bool _toggleEditLanguage = false;

  void toggleCertificate() {
    _toggleEditCertificate = !_toggleEditCertificate;

    print("certificate status: $_toggleEditCertificate");

    rebuildUi();
  }

  Future<void> getLanguages() async {
    final response = await _repo.getLanguages();

    if (response?.statuscode == 200) {
      languages.clear();
      languages.addAll(response?.data ?? []);
    }

    rebuildUi();
  }

  Future<Response?> deleteLanguage(int languageId) async {
    return await _repo.deleteLanguage(languageId);
  }

  Future<Response?> deleteCertificate(int certificateId) async {
    return await _repo.deleteCertificate(certificateId);
  }

  Future<Response?> uploadCertificate(File certificate) async {
    final user = await MySharedPreferences.getUser();
    return await _repo.uploadCertificateAndNationalCertificate(
        user?.emailAddress ?? "",
        certificate,
        null,
        "certificates",
        Constants.trainer,
        user?.trainerId ?? 0,
        0,
        0,
        0,
        1);
  }

  Future<Response?> updateProfile(
      TrainerProfileData? profileData,
      String description,
      List<int> selectedLanguages,
      String? socialLink) async {
    final data = UpdateTrainerProfile();
    data.trainerId = profileData?.id;
    data.firstName = profileData?.firstName;
    data.lastName = profileData?.lastName;
    data.mobileNo = profileData?.mobileNumber;
    data.email = profileData?.emailAddress;
    data.dob = profileData?.doB;
    data.genderId = 1;
    data.description =
        description.isNotEmpty ? description : profileData?.description;
    data.nationality = profileData?.nationality;
    data.residence = profileData?.countryResidence;

    if (selectedLanguages.isEmpty) {
      data.selectedLanguages.clear();
      data.selectedLanguages
          .addAll(profileData?.languages?.map((lang) => lang.id ?? 0) ?? []);
    } else {
      data.selectedLanguages.clear();
      data.selectedLanguages.addAll(selectedLanguages);
    }

    data.selectedSpecialization.clear();
    data.selectedSpecialization.addAll(
        profileData?.specializations?.map((spec) => spec.id ?? 0) ?? []);

    data.selectedPersonalServices.clear();
    data.selectedPersonalServices.addAll(profileData?.personalTrainingservices
            ?.map((service) => service.id ?? 0) ??
        []);

    data.socialLinks.clear();
    data.socialLinks.addAll(socialLinks);

    if (socialLink?.isNotEmpty == true) {
      data.socialLinks.add(socialLink);
    }
    return await _repo.updateTrainerProfile(data);
  }

  void toggleLanguage() {
    _toggleEditLanguage = !_toggleEditLanguage;

    rebuildUi();
  }

  bool isLanguageEditable() {
    return _toggleEditLanguage;
  }

  bool isCertificateEditable() {
    return _toggleEditCertificate;
  }
}
