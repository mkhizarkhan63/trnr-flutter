import 'package:stacked/stacked.dart';

import '../../../../../../app/app.locator.dart';
import '../../../../../../models/GetTrainerMediaResponse.dart';
import '../../../../../../utils.dart';
import '../../../../repo/CTrainerProfileRepo.dart';

class CMediatabviewModel extends BaseViewModel {
  final _repo = locator<CTrainerProfileRepo>();

  final List<TrainerMedia> picturesList = [];
  final List<TrainerMedia> videosList = [];

  Future<void> getTrainerMedia(int trainerId, int mediaType) async {
    final response = await _repo.getTrainerMedia(trainerId ?? 0, mediaType);

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
}
