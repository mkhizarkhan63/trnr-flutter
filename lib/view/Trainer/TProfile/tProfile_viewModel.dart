import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/GetTrainerProfileResponse.dart';
import 'package:trainr/view/Trainer/repo/TrainerDashboardRepo.dart';

class TProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<TrainerDashboardRepo>();
  TrainerProfileData? trainerProfileData;

  FilePickerResult? result;
  String fileName = "No file selected";

  Future<void> getFirebaseToken() async {
    await _repo.getFirebaseToken();
  }

  Future<void> getTrainerProfileById() async {
    final userData = await MySharedPreferences.getUser();

    if (userData != null) {
      final response =
          await _repo.getTrainerProfileById(userData.trainerId ?? 0);

      if (response != null) {
        trainerProfileData = response.data;
      } else {
        trainerProfileData = null;
      }
    } else {
      trainerProfileData = null;
    }

    rebuildUi();
  }

  Widget btnContent = const Text(
    "Change Image",
    style: TextStyle(
        fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
  );

  filePakar(FilePickerResult data) {
    result = data;

    fileName = result!.files.first.name;

    rebuildUi();
  }

  Future<String> uploadImage() async {
    showLoading();
    // if (result != null) {
    //   if (result!.files.isNotEmpty) {
    //     final fileExt = result!.files.first.extension!.toLowerCase();

    //     if (fileExt == 'jpg' || fileExt == 'png' || fileExt == 'jpeg') {
    //       final file = File(result!.files.first.path!);
    //       final String filePath =
    //           "users/${trainerData!.id}/profilePics/${result!.files.first.name}";
    //       final upload = storageRef.child(filePath).putFile(file);

    //       final imageUrlSnapshot = await upload.whenComplete(() {});

    //       final imageUrl = await imageUrlSnapshot.ref.getDownloadURL();

    //       trainerData!.userImg = imageUrl;

    //       try {
    //         await updateTrainer(trainerData: trainerData!).then(
    //           (value) {
    //             locator<TrainerData>().trainer = trainerData!;
    //             return "Image Uploaded Successfully!";
    //           },
    //         );
    //       } catch (e) {
    //         return "Image upload failed!";
    //       }
    //       hideLoading();
    //       return Future.value("File Uploaded Successfully?");
    //     } else {
    //       hideLoading();
    //       return "File type not supported!";
    //     }
    //   } else {
    //     hideLoading();
    //     return Future.value("No file selected!");
    //   }
    // } else {
    //   hideLoading();
    //   return Future.value("File not selected!");
    // }
    return Future.value("Test!");
  }

  showLoading() {
    btnContent = SizedBox(
        height: 50,
        child: /*LoadingAnimationWidget.prograssiveDots(
        color: Colors.white,
        size: 50,
      ),*/
            Container());

    rebuildUi();
  }

  hideLoading() {
    btnContent = const Text(
      "Change Image",
      style: TextStyle(
          fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
    );

    rebuildUi();
  }

  navigateToTSettingView() {
    _navigationService.replaceWithTSettingView();
  }

  navigateToTNotificationView() {
    _navigationService.navigateToTNotificationView();
  }

  navigateToTMyInformation() {
    _navigationService.navigateToTMyInformationView();
  }
}
