import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/DailyHabitModel.dart';

class RowDailyHabit extends StatelessWidget {
  DailyHabitModel? mModel;
  final String role;

  RowDailyHabit(
      {super.key, required DailyHabitModel model, required this.role}) {
    mModel = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Wrap(
        children: [
          Text(
            mModel!.habitName,
            style: TextStyle(
                color: role == "trainer"
                    ? ThemeColor.textfieldColor
                    : ThemeColor.secondaryColor,
                fontSize: 14,
                decorationColor: role == "trainer"
                    ? ThemeColor.textfieldColor
                    : ThemeColor.secondaryColor,
                decoration: TextDecoration.underline),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: /*ListView.builder(
                itemCount: mModel!.values.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ;
                }),*/
                  Row(
                children: _values(),
              ))
        ],
      ),
    );
  }

  List<Widget> _values() {
    return List<Widget>.generate(mModel!.values.length, (index) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: AutoSizeText(
            mModel!.values[index],
            maxLines: 1,
            style: TextStyle(
                color: role == "trainer"
                    ? ThemeColor.textfieldColor
                    : ThemeColor.secondaryColor,
                fontSize: 12),
          ),
        ),
      );
    });
  }
}
