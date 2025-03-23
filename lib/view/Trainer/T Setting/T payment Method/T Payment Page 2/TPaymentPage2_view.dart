import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20payment%20Method/T%20Payment%20Page%202/TpaymentPage2_viewModel.dart';

class TPaymentpage2View extends StatelessWidget {
  TPaymentpage2View({super.key});

  final cardNumber1FocusNode = FocusNode();
  final cardNumber2FocusNode = FocusNode();
  final cardNumber3FocusNode = FocusNode();
  final cardNumber4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TPaymentPage2ViewModel(),
        builder: (context, TPaymentPage2ViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ThemeColor.textfieldColor,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.settings,
                          color: ThemeColor.primaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 4, top: 8),
                      child: Text(
                        "Payment Method",
                        style: TextStyle(
                            fontSize: 22,
                            color: ThemeColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _cardNumberText(),
                          _cardNumber(viewModel),
                          _expiryDateAndCvcText(),
                          _expiryDateAndCvc(viewModel),
                          _cardOnNameText(),
                          _cardHolderName(viewModel),
                          _submitButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // bottomNavigationBar: const ClientBottombarView(),
          );
        });
  }

  Widget _cardNumberText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "Card Number",
        style: TextStyle(
          fontSize: 18,
          decoration: TextDecoration.underline,
          color: ThemeColor.textfieldColor,
          decorationColor: ThemeColor.textfieldColor,
        ),
      ),
    );
  }

  Widget _cardNumber(TPaymentPage2ViewModel viewModel) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: ThemeColor.textfieldColor),
          borderRadius: BorderRadius.circular(5)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 1,
                controller: viewModel.cardNumberSection1Controller,
                focusNode: cardNumber1FocusNode,
                maxLength: 4,
                textAlign: TextAlign.center,
                style: const TextStyle(color: ThemeColor.textfieldColor),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 4) {
                    cardNumber2FocusNode.requestFocus();
                  }
                },
                decoration: const InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.textfieldColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.textfieldColor),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.textfieldColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  maxLines: 1,
                  maxLength: 4,
                  focusNode: cardNumber2FocusNode,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      cardNumber1FocusNode.requestFocus();
                    }

                    if (value.length == 4) {
                      cardNumber3FocusNode.requestFocus();
                    }
                  },
                  controller: viewModel.cardNumberSection2Controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: ThemeColor.textfieldColor),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.textfieldColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.textfieldColor),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.textfieldColor),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                maxLines: 1,
                maxLength: 4,
                textAlign: TextAlign.center,
                focusNode: cardNumber3FocusNode,
                controller: viewModel.cardNumberSection3Controller,
                onChanged: (value) {
                  if (value.isEmpty) {
                    cardNumber2FocusNode.requestFocus();
                  }

                  if (value.length == 4) {
                    cardNumber4FocusNode.requestFocus();
                  }
                },
                style: const TextStyle(color: ThemeColor.textfieldColor),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.textfieldColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.textfieldColor),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeColor.textfieldColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: TextField(
                  maxLines: 1,
                  maxLength: 4,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      cardNumber3FocusNode.requestFocus();
                    }
                  },
                  controller: viewModel.cardNumberSection4Controller,
                  textAlign: TextAlign.center,
                  focusNode: cardNumber4FocusNode,
                  style: const TextStyle(
                      color: ThemeColor.textfieldColor, fontSize: 14),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    counterText: "",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.textfieldColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.textfieldColor),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeColor.textfieldColor),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _expiryDateAndCvc(TPaymentPage2ViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: TextField(
                maxLength: 5,
                keyboardType: TextInputType.number,
                controller: viewModel.expiryDateController,
                onChanged: (value) {},
                style: const TextStyle(
                    color: ThemeColor.textfieldColor, fontSize: 14),
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ThemeColor.textfieldColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ThemeColor.textfieldColor))
                    // labelText: 'Enter text',
                    )),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            child: TextField(
                maxLines: 1,
                controller: viewModel.cvcController,
                maxLength: 3,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                style: const TextStyle(
                    color: ThemeColor.textfieldColor, fontSize: 14),
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ThemeColor.textfieldColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ThemeColor.textfieldColor))
                    // labelText: 'Enter text',
                    )),
          ),
        ),
      ],
    );
  }

  Widget _cardOnNameText() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Text(
        "Name on Card",
        style: TextStyle(
          fontSize: 18,
          decoration: TextDecoration.underline,
          color: ThemeColor.textfieldColor,
          decorationColor: ThemeColor.textfieldColor,
        ),
      ),
    );
  }

  Widget _cardHolderName(TPaymentPage2ViewModel viewModel) {
    return TextField(
      maxLines: 1,
      controller: viewModel.holderNameController,
      decoration: const InputDecoration(
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColor.lightGrey1Color)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColor.lightGrey1Color)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColor.lightGrey1Color))),
      style: const TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
    );
  }

  Widget _expiryDateAndCvcText() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Text(
                "Expiry Date",
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  color: ThemeColor.textfieldColor,
                  decorationColor: ThemeColor.textfieldColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              child: const Text(
                "Security Code",
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                  color: ThemeColor.textfieldColor,
                  decorationColor: ThemeColor.textfieldColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: 250,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ThemeColor.textfieldColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {},
          child: const Text(
            'Submit',
            style: TextStyle(
              fontSize: 16,
              color: ThemeColor.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
