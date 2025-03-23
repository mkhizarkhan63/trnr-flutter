import 'package:dio/dio.dart';

import '../../../network/ApiServiceImpl.dart';
import '../../repo/BaseRepo.dart';

class TrainerDashboardRepo extends BaseRepo {
  Future<Response?> deleteCertificate(int certificateId) async {
    final response =
        await ApiServiceImpl.instance.deleteCertificate(certificateId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> deleteLanguage(int languageId) async {
    final response = await ApiServiceImpl.instance.deleteLanguage(languageId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  Future<Response?> deleteMedia(
    int trainerId,
    int mediaId,
    int mediaType,
  ) async {
    final response = await ApiServiceImpl.instance
        .deleteMedia(trainerId, mediaId, mediaType);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
