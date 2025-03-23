import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/customServices/trainerForm.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/view/Trainer/repo/TrainerPersonalTrainingRepo.dart';

import '../../../cache/MySharedPreferences.dart';
import '../../../utils.dart';
import '../../models/CreateTrainerServicesResponse.dart';

class SelectTrainingServiceViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final form = locator<TrainerForm>();
  final List<PersonalTrainingData> personalTrainingList = [];
  final _repo = locator<UserPersonalTrainingRepo>();
  RegistrationData? userData;

  Future<void> getUserFromCache() async {
    final user = await MySharedPreferences.getUser();
    if (user != null) {
      userData = user;
    }
  }

  Future<void> getPersonalTrainingFromApi() async {
    final response = await _repo.getPersonalTrainingServices();

    if (response != null) {
      personalTrainingList.clear();
      personalTrainingList.addAll(response.data ?? []);

      rebuildUi();
    }
  }

  void togglePersonalTraining(int index) {
    personalTrainingList[index].isSelected =
        !personalTrainingList[index].isSelected;

    rebuildUi();
  }

  Future<CreateTrainerServicesResponse?> addUserPersonalServices() async {
    CreateTrainerServicesResponse? response;

    if (userData?.typeId == Constants.trainer) {
      response = await _repo.addUserPersonalTraining(
          userData?.trainerId ?? 0,
          0,
          Constants.trainer,
          personalTrainingList
              .where((data) => data.isSelected)
              .map((value) => value.id)
              .toList());
    } else {
      response = await _repo.addUserPersonalTraining(
          0,
          userData?.clientId ?? 0,
          Constants.client,
          personalTrainingList
              .where((data) => data.isSelected)
              .map((value) => value.id)
              .toList());
    }

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  bool checkPersonalService() {
    return personalTrainingList
        .where((data) => data.isSelected)
        .map((value) => value.id)
        .toList()
        .isEmpty;
  }

  navigateToTrainerDashboard() {
    _navigationService.replaceWithTProfileView();
  }

  navigateToClientDashboard() {
    _navigationService.replaceWithClientHomeView();
  }

  navigateToChooseSpecialization() {
    _navigationService.replaceWithTChooseSpecializationView();
  }
}
