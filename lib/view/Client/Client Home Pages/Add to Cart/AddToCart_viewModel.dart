import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/models/CreatePaymentByStripeResponse.dart';
import 'package:trainr/view/Client/repo/AddToCartRepo.dart';
import '../../../../app/app.locator.dart';

class AddToCartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<AddToCartRepo>();
  bool _isPaymentDone = false;

  bool get isPaymentDone => _isPaymentDone;

  Future<CreatePaymentByStripeResponse?> createPaymentIntent(
      String amount, String currency) async {
    return await _repo.createPaymentByStripe(amount, currency);
  }

  Future<void> makePayment(String amount, String currency) async {
    try {
      //STEP 1: Create Payment Intent
      final paymentIntent = await createPaymentIntent(amount, currency);

      //STEP 2: Initialize Payment Sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
        applePay: const PaymentSheetApplePay(
          merchantCountryCode: 'US',
        ),
        googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
        paymentIntentClientSecret: paymentIntent?.clientSecret ?? "",
        intentConfiguration: IntentConfiguration(
            mode: IntentMode.paymentMode(
                currencyCode: currency, amount: int.parse(amount))),
        //Gotten from payment intent
        style: ThemeMode.light,
        merchantDisplayName: 'Ikay',
        allowsDelayedPaymentMethods: true,
      ));

      //STEP 3: Display Payment sheet
      _displayPaymentSheet();
    } catch (err) {
      print("make payment: $err");
    }
  }

  void _displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(options: const PaymentSheetPresentOptions())
          .then((value) {
        //Clear paymentIntent variable after successful payment
        _isPaymentDone = true;
        rebuildUi();
      }).onError((error, stackTrace) {
        print("display: $error");
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
    } catch (e) {
      print('$e');
    }
  }

/* void navigateToCCreditCardView() {
    navigationService.replaceWithCCreditCardView();
  }*/
}
