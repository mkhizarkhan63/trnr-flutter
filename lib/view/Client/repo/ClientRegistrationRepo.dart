import 'package:trainr/Client_services/ClientForm.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

import '../../../models/RegistrationResponse.dart';
import '../../../network/ApiServiceImpl.dart';

class ClientRegistrationRepo extends BaseRepo {
  Future<RegistrationResponse?> registerClient(ClientForm form) async {
    final response = await ApiServiceImpl.instance.registerClient(form);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
