
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.router.dart';

import '../../../app/app.locator.dart';

class NotificationViewmodel extends BaseViewModel{
  final navigationService = locator<NavigationService>();

  void navigateToSettingView() {
    navigationService.navigateToSettingView();
  }

}