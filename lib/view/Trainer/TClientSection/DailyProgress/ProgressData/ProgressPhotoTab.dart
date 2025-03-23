import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../../components/RowProgressData.dart';
import 'ProgressDataViewModel.dart';

class ProgressPhotoTab extends StatelessWidget {
  ProgressPhotoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ProgressDataViewModel(),
        builder: (context, ProgressDataViewModel viewModel, index) {
          return Scaffold(
            floatingActionButton: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              padding: const EdgeInsets.all(10),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.compare,
                    color: ThemeColor.textfieldColor,
                  ),
                  GestureDetector(
                    onTap: () {
                      viewModel.navigateToCompareProgressDataView();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "Compare",
                        style: TextStyle(
                            color: ThemeColor.textfieldColor,
                            fontSize: 14,
                            fontFamily: 'verdanab'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: viewModel.progressData.length,
                  itemBuilder: (context, index) {
                    final data = viewModel.progressData[index];
                    return RowProgressData(
                        dataIndex: index, model: data, viewModel: viewModel);
                  }),
            ),
          );
        });
  }
}
