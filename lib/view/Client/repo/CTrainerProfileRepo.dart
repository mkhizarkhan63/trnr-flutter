import 'package:dio/dio.dart';
import 'package:trainr/network/ApiServiceImpl.dart';
import 'package:trainr/view/repo/BaseRepo.dart';

class CTrainerProfileRepo extends BaseRepo {
  Future<Response?> rateTrainer(
      int trainerId, int clientId, int rating, String comments) async {
    final response = await ApiServiceImpl.instance
        .rateTrainer(trainerId, clientId, rating, comments);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
