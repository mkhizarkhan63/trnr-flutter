import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/components/dialog/sortby/SortByViewModel.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../RowSearchLocation.dart';

class SortByDialog extends StatelessWidget {
  const SortByDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SortByViewModel(),
        builder: (ctx, viewModel, index) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: ThemeColor.primaryColor,
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
                            color: ThemeColor.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Sort By",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 250,
                    child: ListView.builder(
                        itemCount: viewModel.sortByList.length,
                        itemBuilder: (context, index) {
                          return RowSearchLocation(
                            name: viewModel.sortByList[index].locationName,
                            isSelected: viewModel.sortByList[index].isSelected,
                            onLocationClick: () {
                              viewModel.selectOption(index);
                            },
                          );
                        }),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Show",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeColor.primaryColor, fontSize: 16),
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
