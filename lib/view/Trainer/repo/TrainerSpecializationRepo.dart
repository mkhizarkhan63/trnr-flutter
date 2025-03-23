import 'package:trainr/models/CreateTrainerSpecializationResponse.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

import '../../../network/ApiServiceImpl.dart';

class TrainerSpecializationRepo extends BaseRepo {
  Future<CreateTrainerSpecializationResponse?> addUserSpecializations(
      num trainerId,
      int clientId,
      int typeId,
      List<num> selectedSpecializations) async {
    final response = await ApiServiceImpl.instance.addUserSpecializations(
        trainerId, clientId, typeId, selectedSpecializations);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
