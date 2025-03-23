import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/setting/Payment%20Method/payment%20Method%20Page1/PaymentPage1_viewModel.dart';

import '../../../../Trainer/components/RowPaymentCard.dart';

class PaymentPage1View extends StatelessWidget {
  const PaymentPage1View({super.key});

  final _role = "client";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => PaymentPage1ViewModel(),
        builder: (context, PaymentPage1ViewModel viewModel, index) {
          return Scaffold(
              backgroundColor: ThemeColor.primaryColor,
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
                                  color: ThemeColor.secondaryColor,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.settings,
                              color: ThemeColor.secondaryColor,
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
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.secondaryColor),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return RowPaymentCard(
                                role: _role,
                                onEditClick: () {},
                                onDeleteClick: () {},
                              );
                            }),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: ThemeColor.secondaryColor),
                                borderRadius: BorderRadius.circular(5)),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.navigateToPaymentPage2();
                              },
                              child: const Icon(
                                Icons.add,
                                size: 30,
                                color: ThemeColor.secondaryColor,
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ));
        });
  }
}
