import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Cardio/ClientCardio_viewModel.dart';

import '../../components/RowCCardio.dart';

class ClientCardioView extends StatelessWidget {
  const ClientCardioView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ClientCardioViewModel(),
        builder: (ctx, ClientCardioViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                              "Trainer name",
                              style: const TextStyle(
                                fontSize: 20,
                                color: ThemeColor.secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: ThemeColor.secondaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 100),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ThemeColor.secondaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: const Center(
                        child: Text(
                          "Cardio session",
                          style: TextStyle(
                            fontSize: 20,
                            color: ThemeColor.secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: ThemeColor.secondaryColor,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return RowCCardio(
                                name: "Cardio 1",
                                days: "5 days",
                                time: "2 times",
                                round: "2 round",
                                rest: "5",
                                duration: "10 minutes");
                          }))
                ],
              ),
            ),
          );
        });
  }
}
