import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../RowSearchLocation.dart';
import 'SearchLocationViewModel.dart';

class SearchLocationDialog extends StatelessWidget {
  const SearchLocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SearchLocationViewModel(),
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
                          "Search by location",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: ThemeColor.textfieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.searchController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Search here"),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: const Text(
                      "(Select one or more)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 250,
                    child: ListView.builder(
                        itemCount: viewModel.locationList.length,
                        itemBuilder: (context, index) {
                          return RowSearchLocation(
                            name: viewModel.locationList[index].locationName,
                            isSelected:
                                viewModel.locationList[index].isSelected,
                            onLocationClick: () {
                              viewModel.selectLocation(index);
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
