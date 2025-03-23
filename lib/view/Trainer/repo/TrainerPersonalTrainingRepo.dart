import 'package:trainr/models/CreateTrainerSpecializationResponse.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

import '../../../models/CreateTrainerServicesResponse.dart';
import '../../../network/ApiServiceImpl.dart';

class UserPersonalTrainingRepo extends BaseRepo {
  Future<CreateTrainerServicesResponse?> addUserPersonalTraining(
      num trainerId,
      int clientId,
      int typeId,
      List<num?> selectedPersonalTraining) async {
    final response = await ApiServiceImpl.instance.addUserPersonalServices(
        trainerId, clientId, typeId, selectedPersonalTraining);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
