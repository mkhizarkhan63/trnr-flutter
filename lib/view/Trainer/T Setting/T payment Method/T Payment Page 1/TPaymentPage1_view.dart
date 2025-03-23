import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20payment%20Method/T%20Payment%20Page%201/TPaymentPage1_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowPaymentCard.dart';

class TPaymentPage1View extends StatelessWidget {
  const TPaymentPage1View({super.key});

  final _role = "trainer";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TPaymentPage1ViewModel(),
        builder: (context, TPaymentPage1ViewModel viewModel, index) {
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
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.primaryColor),
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
                                  width: 2, color: ThemeColor.textfieldColor),
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: GestureDetector(
                            onTap: () {
                              viewModel.navigateToTPaymentPage2();
                            },
                            child: const Icon(
                              Icons.add,
                              size: 30,
                              color: ThemeColor.textfieldColor,
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            // bottomNavigationBar: const ClientBottombarView(),
          );
        });
  }
}
