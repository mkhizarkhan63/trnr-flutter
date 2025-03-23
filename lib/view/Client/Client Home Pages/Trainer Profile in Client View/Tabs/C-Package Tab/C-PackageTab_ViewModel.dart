import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

import '../../../../../../models/GetSessionByUserResponse.dart';
import '../../../../../../utils.dart';
import '../../../../repo/CTrainerProfileRepo.dart';

class CPackageTabViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<CTrainerProfileRepo>();

  final List<SessionData> sessionsList = [];
  List<Map> userPackages = [];

  Future<void> getSessionsByUser(int trainerId) async {
    final response =
        await _repo.getSessionsByUser(Constants.trainer, trainerId, 0);

    if (response != null) {
      sessionsList.clear();
      sessionsList.addAll(response.data ?? []);
    }

    rebuildUi();
  }

  void navigateToAddToCart() {
    _navigationService.navigateToAddToCartView();
  }
}
