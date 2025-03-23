import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../../components/RowData.dart';
import 'DataViewModel.dart';

class DataTab extends StatelessWidget {
  DataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DataViewModel(),
        builder: (context, DataViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: ListView.builder(
                itemCount: viewModel.data.length,
                itemBuilder: (context, index) {
                  return RowData(
                      data: viewModel.data[index],
                      viewModel: viewModel,
                      index: index);
                }),
          );
        });
  }
}
