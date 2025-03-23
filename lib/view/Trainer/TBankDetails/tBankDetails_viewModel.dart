import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/customServices/trainerForm.dart';

class TBankDetailsViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final form = locator<TrainerForm>();
  bool termsCheck = true;

  String? bankName;
  final hnameController = TextEditingController();
  final ibanController = TextEditingController();
  final swiftController = TextEditingController();
  final branchController = TextEditingController();
  bool termsNAgCheck = false;

  String? errorMsg;

  navigateToCodeConfirmationScreen() {
    /*print("t4Bankname = $bankName");
    print(hnameController.value.text);
    form.bHolderName = hnameController.value.text;
    form.iban = ibanController.value.text;
    form.swiftCode = swiftController.value.text;
    form.bCode = branchController.value.text;
    form.termsCheck = termsNAgCheck;

    String? msg = form.bankFormCheck();

    if (msg == null) {
      print("Success");
      errorMsg = null;
      navigationService.replaceWithTCodeConfirmationView();
    } else {
      print(msg);
      errorMsg = msg;
      return msg;
    }*/

    // navigationService.navigateToTCodeConfirmationView();
  }

  changeBankName(value) {
    /* bankName = value;
    form.bankName = value;
    print("t2Bank = $bankName");*/
  }

  changeTermsBool() {
    if (termsCheck == true) {
      termsCheck = false;
    } else {
      termsCheck = true;
    }

    print(termsCheck);

    rebuildUi();
  }

  void selectBankName(String name) {
    bankName = name;
    // form.bankName = bankName;

    rebuildUi();
  }

  selectedBank() {
    return bankName;
  }

  void toggleCheckBox() {
    termsNAgCheck = !termsNAgCheck;

    rebuildUi();
  }

  tncStatus() {
    return termsNAgCheck;
  }

  navigateToRegistrationScreen() {
    navigationService.replaceWithTrainerRegistrationView();
  }
}
