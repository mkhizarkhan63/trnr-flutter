import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/GetTrainerMediaResponse.dart';
import 'package:trainr/utils.dart';
import '../../../../../app/app.locator.dart';
import '../../../repo/TrainerDashboardRepo.dart';

class MediaTabViewModel extends BaseViewModel {
  String selectedTab = "menu";

  final _repo = locator<TrainerDashboardRepo>();
  final List<TrainerMedia> picturesList = [];
  final List<TrainerMedia> videosList = [];

  bool _isEditable = false;

  Future<Response?> uploadTrainerMedia(
      int mediaType, File? picture, File? video) async {
    final userData = await MySharedPreferences.getUser();
    return await _repo.uploadTrainerMedia(userData?.emailAddress ?? "",
        mediaType, picture, video, null, userData?.trainerId ?? 0);
  }

  Future<Response?> deleteTrainerMedia(int mediaType, int mediaId) async {
    final userData = await MySharedPreferences.getUser();
    return await _repo.deleteMedia(
        userData?.trainerId ?? 0, mediaId, mediaType);
  }

  Future<void> getTrainerMedia(int mediaType) async {
    final userData = await MySharedPreferences.getUser();
    final response =
        await _repo.getTrainerMedia(userData?.trainerId ?? 0, mediaType);

    if (response?.data != null) {
      if (response?.data?.trainerMedia?.isNotEmpty == true) {
        if (mediaType == Constants.mediaTypePicture) {
          picturesList.clear();
          picturesList.addAll(response?.data?.trainerMedia ?? []);
        } else {
          videosList.clear();
          videosList.addAll(response?.data?.trainerMedia ?? []);
        }
      }
    }

    rebuildUi();
  }

  reloadScreen() {
    rebuildUi();
  }

  backToMenuBtn() {
    selectedTab = "menu";

    rebuildUi();
  }

  void toggleEdit() {
    _isEditable = !_isEditable;

    rebuildUi();
  }

  isEditable() {
    return _isEditable;
  }
}
