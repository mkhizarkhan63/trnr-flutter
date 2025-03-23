import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20payment%20Method/T%20Payment%20Page%202/TPaymentPage2_view.dart';

class TPaymentPage1ViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToTPaymentPage2() {
    navigationService.navigateToView(TPaymentpage2View());
  }
}
