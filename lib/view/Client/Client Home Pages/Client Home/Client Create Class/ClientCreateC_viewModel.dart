import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.router.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../cache/MySharedPreferences.dart';
import '../../../../../customServices/CreateSessionFrom.dart';
import '../../../../../models/GetActivitiesResponse.dart';
import '../../../../../utils.dart';
import '../../../../Trainer/repo/TrainerSessionsRepo.dart';
import '../../../repo/ClientSessionsRepo.dart';

class ClientCreateCViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController activityController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController whatsAppLinkController = TextEditingController();
  final RadioGroupController genderTypeController = RadioGroupController();

  final _form = locator<CreateSessionForm>();
  final _repo = locator<ClientSessionsRepo>();

  List<ActivitiesData> activities = [];
  List<String> genderTypes = ['Male Only', 'Female Only', 'Mixed'];
  List<String> capacities = ['2', '4', '6', "8"];
  ActivitiesData? _selectedActivity;
  String? _selectedCapacity;
  Map? _selectedLocation;

  final _navigationService = locator<NavigationService>();

  Future<void> getActivities() async {
    final response = await _repo.getActivities();

    if (response != null) {
      activities.clear();
      activities.addAll(response.data ?? []);
    }

    rebuildUi();
  }

  datePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((selectedDate) {
      if (selectedDate != null) {
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
        notifyListeners();
      }
    });
  }

  timePicker(BuildContext context) {
    showTimePicker(
            context: context,
            initialTime: TimeOfDay(
                hour: DateTime.now().hour, minute: DateTime.now().minute))
        .then((selectedTime) {
      if (selectedTime != null) {
        timeController.text = "${selectedTime.hour}:${selectedTime.minute}";
        notifyListeners();
      }
    });
  }

  Future<String> validateForm() async {
    _form.title = titleController.text;
    _form.scheduledDate = dateController.text;
    _form.scheduledTime = dateController.text;
    _form.activityId = _selectedActivity?.id ?? 0;
    _form.totalCapacity = int.parse(_selectedCapacity ?? "0");
    _form.selectedLocation = _selectedLocation ?? null;
    _form.address = _selectedLocation?["locationName"] ?? "";
    _form.classType = genderTypeController.value ?? "";
    _form.description = descriptionController.text;
    _form.price = priceController.text;
    _form.link = whatsAppLinkController.text;

    if (_form.validateData().isEmpty) {
      return "";
    } else {
      return _form.validateData();
    }
  }

  Future<Response?> createSession() async {
    final userData = await MySharedPreferences.getUser();
    final response = await _repo.createSessions(
        Constants.client, 0, userData?.trainerId ?? 0, _form);

    return response;
  }

  void setActivity(ActivitiesData? activity) {
    _selectedActivity = activity;
    rebuildUi();
  }

  void setCapacity(String capacity) {
    _selectedCapacity = capacity;
    rebuildUi();
  }

  void setLocation(Map location) {
    _selectedLocation = location;
    rebuildUi();
  }

  selectedActivity() {
    return _selectedActivity?.name ?? null;
  }

  selectedCapacity() {
    return _selectedCapacity;
  }

  selectedLocation() {
    return _selectedLocation?["locationName"] ?? null;
  }

  void navigateToUploadId() {
    _navigationService.navigateToUploadIdView();
  }
}
