import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/view/Client/setting/Payment%20Method/Payment%20Method%20page2/paymentPage2_view.dart';

class PaymentPage1ViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToPaymentPage2() {
    navigationService.navigateToView(PaymentPage2View());
  }
}
