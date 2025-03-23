import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class ClientTrainerViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  // void navigateToCTrainerCheckIn() {
  //   navigationService.navigateToCTrainerCheckInView();
  // }

  navigateToCTrainerCheckIn() {
    navigationService.navigateToCTrainerCheckInView();
  }
}
