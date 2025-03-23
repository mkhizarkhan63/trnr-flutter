import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/components/RowFilter.dart';
import 'package:trainr/view/Client/components/RowLanguagesFilter.dart';

import '../../../../assets/variables/themeColor.dart';
import 'FilterViewModel.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryColor,
        body: SafeArea(
          child: ViewModelBuilder.reactive(
              viewModelBuilder: () => FilterViewModel(),
              onViewModelReady: (viewModel) async {
                await viewModel.getLanguagesList();
              },
              builder: (ctx, viewModel, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context, false);
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
                              "Filter",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _languageSection(viewModel),
                            const Divider(
                              color: Colors.grey,
                            ),
                            _classTypeSection(viewModel),
                            const Divider(
                              color: Colors.grey,
                            ),
                            _pricingSection(viewModel),
                            const Divider(
                              color: Colors.grey,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 200,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    viewModel.setFilter();
                                    Navigator.pop(context, true);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      "Show",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: ThemeColor.primaryColor,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
        ));
  }

  Widget _languageSection(FilterViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Language",
            style: TextStyle(
                color: ThemeColor.secondaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.languageList.length,
                itemBuilder: (ctx, index) {
                  return RowLanguagesFilter(
                      data: viewModel.languageList[index],
                      onFilterOptionClick: () {
                        viewModel.selectLanguages(index);
                      });
                }),
          )
        ],
      ),
    );
  }

  Widget _classTypeSection(FilterViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Class Type",
            style: TextStyle(
                color: ThemeColor.secondaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: viewModel.classTypeList.length,
                itemBuilder: (ctx, index) {
                  return RowFilter(
                      data: viewModel.classTypeList[index],
                      onFilterOptionClick: () {
                        viewModel.selectClassTypes(index);
                      });
                }),
          )
        ],
      ),
    );
  }

  Widget _pricingSection(FilterViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Pricing",
            style: TextStyle(
                color: ThemeColor.secondaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: viewModel.pricingList.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return RowFilter(
                      data: viewModel.pricingList[index],
                      onFilterOptionClick: () {
                        viewModel.selectPricing(index);
                      });
                }),
          )
        ],
      ),
    );
  }
}
