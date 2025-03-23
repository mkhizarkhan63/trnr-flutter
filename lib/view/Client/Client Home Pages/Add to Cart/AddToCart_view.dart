import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/components/button.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Add%20to%20Cart/AddToCart_viewModel.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({super.key});

  @override
  Widget build(BuildContext context) {
    const String role = "client";

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AddToCartViewModel(),
      builder: (context, AddToCartViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.primaryColor,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const Text(
                        "TRAINR",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    children: [
                      Text(
                        "ALGHFELI ACADMY",
                        style: TextStyle(
                          fontSize: 20,
                          color: ThemeColor.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Body Building",
                        style: TextStyle(
                          fontSize: 18,
                          color: ThemeColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Package",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text(
                      "1 Session",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    children: [
                      Text(
                        "Payment Summary",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Subtotal",
                              style: TextStyle(
                                  color: ThemeColor.secondaryColor,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: Text("AED 300.00",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: ThemeColor.secondaryColor,
                                    fontSize: 16)),
                          ),
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: Text("Appfee",
                                        style: TextStyle(
                                            color: ThemeColor.secondaryColor,
                                            fontSize: 16))),
                                Expanded(
                                    child: Text("AED 9.00",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: ThemeColor.secondaryColor,
                                            fontSize: 16))),
                              ])),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total Amount",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: ThemeColor.secondaryColor),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.right,
                                "AED 309.00",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: ThemeColor.secondaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: MyButton(
                      onTap: () async {
                        // viewModel.navigateToCCreditCardView();
                        await viewModel.makePayment("AED", "500");
                      },
                      role: role,
                      text: "Checkout"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
