import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../../components/RowCProgressData.dart';
import 'CProgressDataViewModel.dart';

class CProgressPhotoTab extends StatelessWidget {
  CProgressPhotoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CProgressDataViewModel(),
        builder: (context, CProgressDataViewModel viewModel, index) {
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
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
              child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: viewModel.progressData.length,
                  itemBuilder: (context, index) {
                    final data = viewModel.progressData[index];
                    return RowCProgressData(
                        dataIndex: index, model: data, viewModel: viewModel);
                  }),
            ),
          );
        });
  }
}
