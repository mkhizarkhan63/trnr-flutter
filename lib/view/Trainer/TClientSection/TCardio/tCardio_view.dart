import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TCardio/tCardio_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowCardio.dart';
import 'package:trainr/view/Trainer/components/dialogs/cardio/AddCardioDialog.dart';

class TCardioView extends StatelessWidget {
  const TCardioView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TCardioViewModel(),
      builder: (context, TCardioViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Column(
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
                              color: ThemeColor.textfieldColor,
                            ),
                          ),
                          Text(
                            "Client name",
                            style: const TextStyle(
                              fontSize: 20,
                              color: ThemeColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            viewModel.toggleEdit();
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                fontSize: 16,
                                color: ThemeColor.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: ThemeColor.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: ThemeColor.primaryColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: ThemeColor.primaryColor, width: 2.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Center(
                      child: Text(
                        "Cardio session",
                        style: TextStyle(
                          fontSize: 20,
                          color: ThemeColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: ThemeColor.primaryColor,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return RowCardio(
                              name: "Cardio 1",
                              days: "5 days",
                              time: "2 times",
                              round: "2 round",
                              rest: "5",
                              duration: "10 minutes",
                              isEditable: viewModel.isEditable(),
                              onDeleteClick: () async {});
                        })),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: ThemeColor.textfieldColor),
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const AddCardioDialog();
                          });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 30,
                      color: ThemeColor.textfieldColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
