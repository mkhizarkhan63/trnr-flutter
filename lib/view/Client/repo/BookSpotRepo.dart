import 'package:dio/dio.dart';
import 'package:trainr/network/ApiServiceImpl.dart';

class BookSpotRepo {
  Future<Response?> bookSession(int sessionId, int clientId) async {
    final response =
        await ApiServiceImpl.instance.bookSession(sessionId, clientId);

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }
}
