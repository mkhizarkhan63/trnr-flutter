import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/ProgressDataModel.dart';
import 'package:trainr/view/Trainer/components/RowProgessDataImage.dart';

import '../C - Trainer sec/DailyProgress/ProgressData/CProgressDataViewModel.dart';


class RowCProgressData extends StatelessWidget {
  ProgressDataModel? _model;
  int _dataIndex = -1;
  CProgressDataViewModel? _viewModel;

  RowCProgressData(
      {super.key,
      required int dataIndex,
      required ProgressDataModel model,
      CProgressDataViewModel? viewModel}) {
    _dataIndex = dataIndex;
    _model = model;
    _viewModel = viewModel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: _model!.date != null
              ? Text(
                  "${_model!.date}",
                  style: const TextStyle(
                      color: ThemeColor.secondaryColor,
                      fontSize: 12,
                      fontFamily: 'verdanab'),
                )
              : const Text("Data is not available",
                  style: TextStyle(
                      color: ThemeColor.secondaryColor,
                      fontSize: 12,
                      fontFamily: 'verdanab')),
        ),
        const Divider(
          color: Colors.black,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              itemCount: _model!.imageList.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = _model!.imageList[index];
                return GestureDetector(
                    onTap: () {
                      _viewModel!.selectImage(_dataIndex, index);
                    },
                    child: RowProgressDataImage(model: data));
              }),
        ),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
