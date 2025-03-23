import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/repo/CTrainerProfileRepo.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../models/GetTrainerProfileResponse.dart';

class CTrainerProfileViewModel extends BaseViewModel {
  final _repo = locator<CTrainerProfileRepo>();
  TrainerProfileData? trainerProfileData;

  Future<void> getTrainerProfileById(int trainerId) async {
    final response = await _repo.getTrainerProfileById(trainerId);

    if (response != null) {
      trainerProfileData = response.data;
    } else {
      trainerProfileData = null;
    }

    rebuildUi();
  }
}
