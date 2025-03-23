import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';
import 'package:trainr/models/trainer_model.dart';

import '../../../../../Client_services/ClientData.dart';
import '../../../../../customServices/FilterForm.dart';
import '../../../repo/ClientDashboardRepo.dart';

class ClientHomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<ClientDashboardRepo>();
  final _filterForm = locator<FilterForm>();
  final _clientData = locator<ClientData>();
  final List<AllSessionData> sessionList = [];
  var selectedDate = "";

  Future<void> getAllSessions(String scheduleDate) async {
    final response = await _repo.getAllSessions(scheduleDate, _filterForm);

    if (response != null) {
      sessionList.clear();
      sessionList.addAll(response.data ?? []);
    }

    rebuildUi();
  }

  Future<void> getFirebaseToken() async {
    await _repo.getFirebaseToken();
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      debugPrint("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        debugPrint("user denied location permission");
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      debugPrint("user denied permission forever");
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<LatLng> getCurrentLocation() async {
    Position currentPosition = await _determineUserCurrentPosition();
    final currentLocation =
        LatLng(currentPosition.latitude, currentPosition.longitude);
    return currentLocation;
  }

  bool isLoading = false;
  bool _isTrainer = true;

  void toggleSection() {
    _isTrainer = !_isTrainer;

    rebuildUi();
  }

  void navigateToNotificationView() {
    _navigationService.navigateToNotificationView();
  }

  void navigateCTrainerProfileView() {
    _navigationService.navigateTo(Routes.cTrainerProfileView);
  }

  void navigateTOClientCView() {
    _navigationService.replaceWithClientCView();
  }

  void navigateTOClientCreateCView() {
    _navigationService.navigateToClientCreateCView();
  }

  void navigateTOCBookSpotView(AllSessionData session) {
    _clientData.sessionData = session;
    _navigationService.navigateToCBookSpotView();
  }

  Future<bool> navigateToFilterView() async {
    return await _navigationService.navigateToFilterView();
  }

  void navigateToClientProfileView() {
    _navigationService.replaceWithClientProfileView();
  }

  Future<List<TrainerQueryDocumentSnapshot>>? getTrainers() async {
    List<TrainerQueryDocumentSnapshot>? data = await getAllTrainers();

    print("data is = ${data!.length}");
    return data;
  }

  navigateToTrainerProfile({required int trainerId}) {
    _navigationService.navigateToCTrainerProfileView();
  }

  isTrainer() {
    return _isTrainer;
  }
}
