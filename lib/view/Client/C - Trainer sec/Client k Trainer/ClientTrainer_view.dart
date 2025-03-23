import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20k%20Trainer/ClientTrainer_viewModel.dart';
import 'package:trainr/view/Client/components/RowClientTrainer.dart';

class ClientTrainerView extends StatelessWidget {
  const ClientTrainerView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ClientTrainerViewModel(),
      builder: (context, ClientTrainerViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      "TRAINRS",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 6.0,
                      ),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return RowClientTrainer(
                            trainerData: "",
                            onTrainerClick: () {
                              viewModel.navigateToCTrainerCheckIn();
                            });
                      }),
                )
              ],
            ),
          ),
          // bottomNavigationBar: const ClientBottombarView(),
        );
      },
    );
  }
}
