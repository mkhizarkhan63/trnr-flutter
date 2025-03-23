import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Suplement/ClientSuplement_viewModel.dart';

import '../../components/RowCSupplement.dart';

class ClientSuplementView extends StatelessWidget {
  const ClientSuplementView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ClientSuplementViewModel(),
        builder: (Contex, ClientSuplementViewModel viewModel, index) {
          return Scaffold(
              backgroundColor: ThemeColor.primaryColor,
              body: SafeArea(
                child: /* FutureBuilder(
                  future: viewModel.getTrainingData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: ThemeColor.secondaryColor,
                                      ),
                                    ),
                                    Text(
                                      "${viewModel.trainerData.firstName} ${viewModel.trainerData.lastName}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: ThemeColor.secondaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Divider(color: ThemeColor.secondaryColor),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: ThemeColor.secondaryColor, width: 2.0),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "Supplements",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeColor.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: AutoSizeText(
                                      "Supplement Name",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.secondaryColor,
                                          decorationColor:
                                              ThemeColor.secondaryColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Expanded(
                                    child: AutoSizeText(
                                      "Dosage",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.secondaryColor,
                                          decorationColor:
                                              ThemeColor.secondaryColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Expanded(
                                    child: AutoSizeText(
                                      "Time",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: ThemeColor.secondaryColor,
                                          decorationColor:
                                              ThemeColor.secondaryColor,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ]),
                          ),
                          const Divider(
                            color: ThemeColor.secondaryColor,
                            thickness: 2,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.supplements.length,
                              itemBuilder: ((context, index) {
                                final supplementList =
                                    snapshot.data!.supplements[index];
                                return RowCSupplement(
                                    name: supplementList["name"],
                                    dosage: supplementList["dosage"],
                                    time: supplementList["time"]);
                              }),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )*/
                    Container(),
              ));
        });
  }
}
