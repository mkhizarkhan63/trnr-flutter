import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/Client_services/ClientData.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/view/Client/repo/BookSpotRepo.dart';

class CBookSpotViewModel extends BaseViewModel {
  final _repo = locator<BookSpotRepo>();
  final clientData = locator<ClientData>();

  Future<Response?> bookSpot(int sessionId) async {
    final userData = await MySharedPreferences.getUser();

    return await _repo.bookSession(sessionId, userData?.clientId ?? 0);
  }
}
