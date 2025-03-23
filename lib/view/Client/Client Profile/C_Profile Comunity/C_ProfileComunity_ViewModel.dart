import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/GetSessionByUserResponse.dart';
import 'package:trainr/view/Client/repo/ClientProfileRepo.dart';

import '../../../../app/app.locator.dart';
import '../../../../utils.dart';

class CProfileComunityViewModel extends BaseViewModel {
  final _repo = locator<ClientProfileRepo>();

  final List<SessionData> sessionsList = [];

  Future<Response?> deleteSession(int sessionId) async {
    return await _repo.deleteSession(sessionId);
  }

  Future<void> getSessionsByUser() async {
    final userData = await MySharedPreferences.getUser();
    final response = await _repo.getSessionsByUser(
        Constants.client, 0, userData?.clientId ?? 0);

    if (response != null) {
      sessionsList.clear();
      sessionsList.addAll(response.data ?? []);
    }

    rebuildUi();
  }
}
