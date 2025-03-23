import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/customServices/UpdateTrainerProfile.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';
import 'package:trainr/view/Trainer/repo/MyInformationRepo.dart';
import 'package:intl/intl.dart';
import '../../../../cache/MySharedPreferences.dart';
import '../../../../models/GetTrainerProfileResponse.dart';

class TMyinformationViewModel extends BaseViewModel {
  TextEditingController? fNameController = TextEditingController(text: "");
  TextEditingController? lNameController = TextEditingController(text: "");
  TextEditingController? emailController = TextEditingController(text: "");
  TextEditingController? phoneController = TextEditingController(text: "");
  TextEditingController? nationalityController =
      TextEditingController(text: "");
  TextEditingController? residenceController = TextEditingController(text: "");
  TextEditingController? descriptionController =
      TextEditingController(text: "");
  String? dob;

  final _repo = locator<MyInformationRepo>();
  final _form = locator<UpdateTrainerProfile>();

  final List<SpecializationData> selectedSpecialization = [];
  final List<PersonalTrainingData> selectedPersonalServices = [];

  final List<SpecializationData> specializationList = [];
  final List<PersonalTrainingData> personalServicesList = [];

  TrainerProfileData? trainerProfileData;

  LocationData? selectedLocation;
  bool _toggleEditSpecialization = false;
  bool _toggleEditService = false;

  File? profileImage;

  String formErrorMsg = "";

  void selectProfileImage(File image) {
    profileImage = image;
    rebuildUi();
  }

  void toggleSpecialization() {
    _toggleEditSpecialization = !_toggleEditSpecialization;

    print("specialization status: $_toggleEditSpecialization");

    rebuildUi();
  }

  void toggleServices() {
    _toggleEditService = !_toggleEditService;

    print("services status: $_toggleEditService");

    rebuildUi();
  }

  Future<void> getSpecializations() async {
    final response = await _repo.getSpecializations();

    if (response != null) {
      specializationList.clear();
      specializationList.addAll(response.data ?? []);
    }
  }

  Future<void> getPersonalServices() async {
    final response = await _repo.getPersonalTrainingServices();

    if (response != null) {
      personalServicesList.clear();
      personalServicesList.addAll(response.data ?? []);
    }
  }

  Future<void> getTrainerProfileById() async {
    final userData = await MySharedPreferences.getUser();

    if (userData != null) {
      final response =
          await _repo.getTrainerProfileById(userData.trainerId ?? 0);

      if (response != null) {
        trainerProfileData = response.data;
        fNameController?.value =
            TextEditingValue(text: trainerProfileData?.firstName ?? "");
        lNameController?.value =
            TextEditingValue(text: trainerProfileData?.lastName ?? "");

        emailController?.value =
            TextEditingValue(text: trainerProfileData?.emailAddress ?? "");

        phoneController?.value =
            TextEditingValue(text: trainerProfileData?.mobileNumber ?? "");

        nationalityController?.value =
            TextEditingValue(text: trainerProfileData?.nationality ?? "");

        residenceController?.value =
            TextEditingValue(text: trainerProfileData?.countryResidence ?? "");

        descriptionController?.value =
            TextEditingValue(text: trainerProfileData?.description ?? "");

        setSpecializations(trainerProfileData?.specializations ?? []);

        setPersonalServices(trainerProfileData?.personalTrainingservices ?? []);

        dob = trainerProfileData?.doB;
        selectedLocation = trainerProfileData?.location;
      } else {
        trainerProfileData = null;
      }
    } else {
      trainerProfileData = null;
    }

    rebuildUi();
  }

  Future<bool> validateForm() async {
    final userData = await MySharedPreferences.getUser();

    _form.trainerId = userData?.clientId ?? 0;
    _form.firstName = fNameController?.text ?? "";
    _form.lastName = lNameController?.text ?? "";
    _form.dob = dob;
    _form.location = selectedLocation;
    _form.genderId = trainerProfileData?.gender?.id ?? 0;
    _form.residence = residenceController?.text ?? "";
    _form.nationality = nationalityController?.text ?? "";
    _form.mobileNo = phoneController?.text ?? "";
    _form.email = emailController?.text ?? "";
    _form.description = descriptionController?.text ?? "";
    _form.profileImage = profileImage;

    _form.selectedSpecialization =
        selectedSpecialization.map((service) => service.id ?? 0).toList();
    _form.selectedPersonalServices =
        selectedPersonalServices.map((service) => service.id ?? 0).toList();

    String? formCheck = _form.validateForm();
    if (formCheck == null) {
      return true;
    } else {
      formErrorMsg = formCheck;
      return false;
    }
  }

  Future<Response?> updateTrainerProfile() async {
    final userData = await MySharedPreferences.getUser();

    _form.trainerId = userData?.trainerId ?? 0;
    _form.firstName = fNameController?.text ?? "";
    _form.lastName = lNameController?.text ?? "";
    _form.dob = dob;
    _form.location = selectedLocation;
    _form.genderId = trainerProfileData?.gender?.id ?? 0;
    _form.residence = residenceController?.text ?? "";
    _form.nationality = nationalityController?.text ?? "";
    _form.mobileNo = phoneController?.text ?? "";
    _form.email = emailController?.text ?? "";
    _form.description = descriptionController?.text ?? "";
    _form.profileImage = profileImage;

    _form.selectedLanguages = trainerProfileData?.languages
            ?.map((service) => service.id ?? 0)
            .toList() ??
        [];
    _form.socialLinks = trainerProfileData?.socialLinks ?? [];
    _form.selectedSpecialization =
        selectedSpecialization.map((service) => service.id ?? 0).toList();
    _form.selectedPersonalServices =
        selectedPersonalServices.map((service) => service.id ?? 0).toList();

    return await _repo.updateTrainerProfile(_form);
  }

  selectDate(DateTime? selectedDate) {
    dob = DateFormat('dd-MM-yy').format(selectedDate!);

    rebuildUi();
  }

  void setSpecializations(List<SpecializationData> specialization) {
    selectedSpecialization.clear();
    selectedSpecialization.addAll(specialization);

    rebuildUi();
  }

  void setPersonalServices(List<PersonalTrainingData> services) {
    selectedPersonalServices.clear();
    selectedPersonalServices.addAll(services);

    rebuildUi();
  }

  void setLocation(LocationData location) {
    selectedLocation = location;
    rebuildUi();
  }

  bool isSpecializationEditable() {
    return _toggleEditSpecialization;
  }

  void removeSpecialization(SpecializationData data) {
    selectedSpecialization.remove(data);

    rebuildUi();
  }

  void removeService(PersonalTrainingData data) {
    selectedPersonalServices.remove(data);

    rebuildUi();
  }

  bool isServiceEditable() {
    return _toggleEditService;
  }
}
