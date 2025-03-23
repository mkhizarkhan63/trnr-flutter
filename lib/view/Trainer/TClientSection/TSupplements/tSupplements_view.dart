import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TSupplements/tSupplements_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowSupplement.dart';
import 'package:trainr/view/Trainer/components/dialogs/supplement/AddSupplementDialog.dart';

class TSupplementsView extends StatelessWidget {
  const TSupplementsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TSupplementsViewModel(),
      builder: (context, TSupplementsViewModel viewModel, index) {
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
                  const Divider(color: ThemeColor.textfieldColor),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ThemeColor.primaryColor, width: 2.0),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          "Supplements",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: AutoSizeText(
                            "Supplement Name",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor,
                                decorationColor: ThemeColor.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        const Expanded(
                          child: AutoSizeText(
                            "Dosage",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor,
                                decorationColor: ThemeColor.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        const Expanded(
                          child: AutoSizeText(
                            "Time",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: ThemeColor.primaryColor,
                                decorationColor: ThemeColor.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        viewModel.isEditable()
                            ? const Icon(
                                Icons.delete,
                                color: ThemeColor.textfieldColor,
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  const Divider(
                    color: ThemeColor.primaryColor,
                    thickness: 2,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return RowSupplement(
                            name: "supplementList",
                            dosage: "supplementList",
                            time: "supplementList",
                            isEditable: viewModel.isEditable(),
                            onDeleteClick: () async {});
                      }),
                    ),
                  ),
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
                              return const AddSupplementDialog();
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
            ));
      },
    );
  }
}
