import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/customServices/UpdateClientProfile.dart';
import 'package:trainr/models/GetClientProfileResponse.dart';
import 'package:trainr/view/Client/repo/ClientUpdateProfileRepo.dart';

import '../../../../models/PersonalTrainingServiceResponse.dart';
import '../../../../models/SpecializationResponseModel.dart';

class InformationViewModel extends BaseViewModel {
  final _repo = locator<ClientUpdateProfileRepo>();
  final _form = locator<UpdateClientProfile>();
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

  Map? _selectedLocation;
  ClientData? clientData;

  final List<SpecializationData> selectedSpecialization = [];
  final List<PersonalTrainingData> selectedPersonalServices = [];

  final List<SpecializationData> specializationList = [];
  final List<PersonalTrainingData> personalServicesList = [];

  bool _toggleEditSpecialization = false;
  bool _toggleEditService = false;
  String formErrorMsg = '';

  File? profileImage;

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

  Future<void> getClientProfile() async {
    final userData = await MySharedPreferences.getUser();
    final response = await _repo.getClientProfile(userData?.clientId ?? 0);

    if (response != null) {
      clientData = response.data;
      fNameController?.value =
          TextEditingValue(text: clientData?.firstName ?? "");
      lNameController?.value =
          TextEditingValue(text: clientData?.lastName ?? "");

      emailController?.value =
          TextEditingValue(text: clientData?.emailAddress ?? "");

      phoneController?.value =
          TextEditingValue(text: clientData?.mobileNumber ?? "");

      nationalityController?.value =
          TextEditingValue(text: clientData?.nationality ?? "");

      residenceController?.value =
          TextEditingValue(text: clientData?.countryResidence ?? "");

      setSpecializations(clientData?.specializations ?? []);

      setPersonalServices(clientData?.personalTrainingServices ?? []);

      dob = clientData?.doB;
      _selectedLocation = clientData?.location as Map;
    }
  }

  Future<bool> validateForm() async {
    final userData = await MySharedPreferences.getUser();

    _form.clientId = userData?.clientId ?? 0;
    _form.firstName = fNameController?.text ?? "";
    _form.lastName = lNameController?.text ?? "";
    _form.dob = dob;
    _form.location = _selectedLocation;
    _form.genderId = clientData?.gender?.id ?? 0;
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

  Future<Response?> updateClientProfile() async {
    return await _repo.updateClientProfile(_form);
  }

  Future<String> saveChanges() async {
    return "";
  }

  void setLocation(Map location) {
    _selectedLocation = location;
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

  selectedLocation() {
    return _selectedLocation?["locationName"];
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
