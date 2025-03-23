import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';

class RowPersonalTraining extends StatelessWidget {
  PersonalTrainingData personalTrainingData;
  Function() onPersonalTrainingClick;

  RowPersonalTraining(this.personalTrainingData, this.onPersonalTrainingClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPersonalTrainingClick();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
            color: personalTrainingData.isSelected
                ? ThemeColor.primaryColor
                : ThemeColor.textfieldColor,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          personalTrainingData.name ?? "",
          style: const TextStyle(color: ThemeColor.darkBackgroundColor, fontSize: 16),
        ),
      ),
    );
  }
}
