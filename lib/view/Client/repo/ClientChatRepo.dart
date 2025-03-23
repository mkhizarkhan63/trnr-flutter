import 'package:trainr/models/GetAllTrainersResponse.dart';
import 'package:trainr/network/ApiServiceImpl.dart';

class ClientChatRepo {
  Future<GetAllTrainersResponse?> getAllTrainers() async {
    final response = await ApiServiceImpl.instance.getAllTrainers();

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
