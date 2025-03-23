import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/components/bottomsheet/DropDownBottomSheet.dart';

import 'PackageViewModel.dart';

class AddPackageDialog extends StatelessWidget {
  const AddPackageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => PackageViewModel(),
        builder: (ctx, viewModel, index) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.textfieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: ThemeColor.textfieldColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Add Package",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColor.textfieldColor,
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return DropDownBottomSheet(
                                      title: "Subscription Type",
                                      dataList: const ["Monthly", "Sessions"],
                                      role: "Trainer",
                                      onItemClick: (lang) {
                                        viewModel.setLimit(null);
                                        viewModel.setType(lang);
                                      },
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel.selectedType() ??
                                      "Select subscription",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColor.backgroundColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: ThemeColor.backgroundColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColor.textfieldColor,
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (ctx) {
                                    return DropDownBottomSheet(
                                      title:
                                          viewModel.selectedType() == "Monthly"
                                              ? "Months"
                                              : "Sessions",
                                      dataList:
                                          viewModel.selectedType() == "Monthly"
                                              ? viewModel.monthsList
                                              : viewModel.sessionsList,
                                      role: "Trainer",
                                      onItemClick: (limit) {
                                        viewModel.setLimit(limit);
                                      },
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel.selectedLimit() ??
                                      (viewModel.selectedType() == "Monthly"
                                          ? "Number of months"
                                          : "Number of Sessions"),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: ThemeColor.backgroundColor,
                                      fontWeight: FontWeight.w400),
                                )),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: ThemeColor.backgroundColor,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        maxLength: 3,
                        maxLines: 1,
                        controller: viewModel.capacityController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            hintText: "Enter capacity"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.priceController,
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            hintText: "Enter price"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () async {
                          String msg = await viewModel.addPackage();

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text(msg),
                          )));
                          if (msg == "Success") {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Add",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeColor.textfieldColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
