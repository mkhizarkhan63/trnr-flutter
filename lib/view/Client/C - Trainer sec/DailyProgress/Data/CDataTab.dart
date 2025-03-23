import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/components/RowCData.dart';

import '../../../../../assets/variables/themeColor.dart';
import 'CDataViewModel.dart';

class CDataTab extends StatelessWidget {
  CDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CDataViewModel(),
        builder: (context, CDataViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: ListView.builder(
                itemCount: viewModel.data.length,
                itemBuilder: (context, index) {
                  return RowCData(
                      data: viewModel.data[index],
                      viewModel: viewModel,
                      index: index);
                }),
          );
        });
  }
}
