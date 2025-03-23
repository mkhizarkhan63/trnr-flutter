import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/Trainer/repo/TrainerSpecializationRepo.dart';

import '../../../cache/MySharedPreferences.dart';
import '../../../models/CreateTrainerSpecializationResponse.dart';

class SelectSpecializationViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _specializationRepo = locator<TrainerSpecializationRepo>();

  List<SpecializationData> _selectedSpecializations = [];
  List<SpecializationData> _specializations = [];

  final specializationController = TextEditingController();

  Future<void> getUserDetailsFromCache() async {
    final data = await MySharedPreferences.getUser();

    rebuildUi();
    print("cache data: $data");
  }

  Future<CreateTrainerSpecializationResponse?> addUserSpecialization() async {
    final userData = await MySharedPreferences.getUser();

    CreateTrainerSpecializationResponse? response;

    if (userData?.typeId == Constants.trainer) {
      response = await _specializationRepo.addUserSpecializations(
          userData?.trainerId ?? 0,
          0,
          Constants.trainer,
          _selectedSpecializations.map((data) => data.id ?? 0).toList());
    } else {
      response = await _specializationRepo.addUserSpecializations(
          0,
          userData?.clientId ?? 0,
          Constants.client,
          _selectedSpecializations.map((data) => data.id ?? 0).toList());
    }

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<void> getSpecializationsFromApi() async {
    final response = await _specializationRepo.getSpecializations();

    if (response != null) {
      _specializations.clear();
      _specializations.addAll(response.data ?? []);

      rebuildUi();
    }
  }

  bool checkSpecializations() {
    if (_selectedSpecializations.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void addSpecialization(SpecializationData data) {
    _selectedSpecializations.add(data);
    _specializations.remove(data);

    rebuildUi();
  }

  void removeSpecialization(SpecializationData data) {
    _selectedSpecializations.remove(data);
    _specializations.add(data);

    rebuildUi();
  }

  List<SpecializationData> getSelectedSpecializations() {
    return _selectedSpecializations;
  }

  List<SpecializationData> getSpecializations() {
    return _specializations;
  }

  navigateToChooseTrainingService() {
    _navigationService.replaceWithTChooseTrainingServiceView();
  }

  navigateToOtpScreen() {
    _navigationService.replaceWithTCodeConfirmationView();
  }
}
