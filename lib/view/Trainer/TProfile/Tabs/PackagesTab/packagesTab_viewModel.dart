import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/customServices/CreateSessionFrom.dart';
import 'package:trainr/models/GetSessionByUserResponse.dart';

import '../../../../../cache/MySharedPreferences.dart';
import '../../../../../utils.dart';
import '../../../repo/TrainerDashboardRepo.dart';

class PackagesTabViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final _repo = locator<TrainerDashboardRepo>();
  final userPackages = ["String"];
  final List<SessionData> sessionsList = [];

  final _form = locator<CreateSessionForm>();

  Future<void> getSessionsByUser() async {
    final userData = await MySharedPreferences.getUser();
    final response = await _repo.getSessionsByUser(
        Constants.trainer, userData?.trainerId ?? 0, 0);

    if (response != null) {
      sessionsList.clear();
      sessionsList.addAll(response.data ?? []);
    }

    rebuildUi();
  }

  Future<Response?> deleteSession(int sessionId) async {
    return await _repo.deleteSession(sessionId);
  }

  navigateToTCreateClassView(SessionData? session) async {
    _form.sessionData = session;
    _form.id = session?.id;
    return await navigationService.navigateToTCreateClassView();
  }

  navigateToAddPackages() {
    navigationService.navigateToAddPackagesView();
  }
}
