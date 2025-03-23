import 'package:trainr/customServices/trainerForm.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

import '../../../network/ApiServiceImpl.dart';

class TrainerRegistrationRepo extends BaseRepo {
  Future<RegistrationResponse?> registerTrainer(TrainerForm form) async {
    final response = await ApiServiceImpl.instance.registerTrainer(form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
