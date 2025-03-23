import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/CCreditCard_view.dart/CCreditCard_viewModel.dart';
import 'package:trainr/view/component/dialogs/loading_dialog.dart';

class CCreditCardView extends StatelessWidget {
  const CCreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CCreditCardViewModel(),
        builder: (context, CCreditCardViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            appBar: AppBar(
              backgroundColor: ThemeColor.primaryColor,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return const LoadingDialog(
                                  message: "Please wait....");
                            });

                        /* final trainerResult =
                            await viewModel.subscribeTrainer();

                        if (trainerResult == "Success") {
                          final clientResult =
                              await viewModel.subscribeClient();

                          if (clientResult == "Success") {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        }*/
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "G",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "Pay",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return const LoadingDialog(
                                  message: "Please wait....");
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.apple,
                            color: ThemeColor.primaryColor,
                            size: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "Pay",
                              style: TextStyle(
                                color: ThemeColor.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return const LoadingDialog(
                                  message: "Please wait....");
                            });
                      },
                      child: const Text(
                        "Credit card/Debit card",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
          );
        });
  }
}
