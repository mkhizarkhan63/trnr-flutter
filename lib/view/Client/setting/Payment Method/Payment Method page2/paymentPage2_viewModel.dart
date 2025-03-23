import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class PaymentPage2ViewModel extends BaseViewModel {
  final cardNumberSection1Controller = TextEditingController();
  final cardNumberSection2Controller = TextEditingController();
  final cardNumberSection3Controller = TextEditingController();
  final cardNumberSection4Controller = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvcController = TextEditingController();
  final holderNameController = TextEditingController();
}
