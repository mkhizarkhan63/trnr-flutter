import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radio_group_v2/widgets/view_models/radio_group_controller.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/customServices/CreateSessionFrom.dart';
import 'package:trainr/models/GetActivitiesResponse.dart';

import '../../../../utils.dart';
import '../../repo/TrainerSessionsRepo.dart';

class TCreateClassViewModel extends BaseViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController whatsAppLinkController = TextEditingController();
  final RadioGroupController genderTypeController = RadioGroupController();

  final _form = locator<CreateSessionForm>();
  final _repo = locator<TrainerSessionsRepo>();
  var isUpdate = false;

  List<ActivitiesData> activities = [];
  List<String> genderTypes = ['Male Only', 'Female Only', 'Mixed'];
  List<String> capacities = ['2', '4', '6', "8"];
  ActivitiesData? _selectedActivity;
  String? _selectedCapacity;
  Map? _selectedLocation;
  int _genderIndex = -1;

  void getSessionData() {
    final data = _form.sessionData;
    if (data != null) {
      isUpdate = true;
      titleController.value = TextEditingValue(text: data.title ?? "");
      dateController.value = TextEditingValue(text: data.scheduledDate ?? "");
      timeController.value = TextEditingValue(text: data.scheduledTime ?? "");
      descriptionController.value =
          TextEditingValue(text: data.description ?? "");
      priceController.value = TextEditingValue(text: data.price ?? "");
      whatsAppLinkController.value = TextEditingValue(text: data.link ?? "");
      _selectedActivity = ActivitiesData(
          id: data.activity?.id ?? 0, name: data.activity?.name ?? "");
      _selectedCapacity = data.totalCapacity.toString();
      _selectedLocation = {
        "locationName": data.location?.locationName ?? "",
        "lat": data.location?.lat ?? 0.0,
        "longt": data.location?.longt ?? 0.0
      };
      for (var gender in genderTypes) {
        if (gender.replaceAll("Only", "").toLowerCase() == data.classType) {
          _genderIndex = genderTypes.indexOf(gender);
        }
      }

      rebuildUi();
    } else {
      isUpdate = false;
    }
  }

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
        final hours = selectedTime.hour < 10
            ? "0${selectedTime.hour}"
            : selectedTime.hour;
        final minutes = selectedTime.minute < 10
            ? "0${selectedTime.minute}"
            : selectedTime.minute;
        timeController.text = "$hours:$minutes";
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
    _form.classType = (genderTypeController.value as String)
        .replaceAll("Only", "")
        .toLowerCase();
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
        Constants.trainer, userData?.trainerId ?? 0, 0, _form);

    return response;
  }

  Future<Response?> updateSession() async {
    final userData = await MySharedPreferences.getUser();
    final response = await _repo.updateSessions(
        Constants.trainer, userData?.trainerId ?? 0, 0, _form);

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

  int findIndexForClassType() {
    return _genderIndex;
  }
}
