import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

import '../../../models/TirednessModel.dart';

class RowRating extends StatelessWidget {
  RatingModel? _item;
  String? _role;

  RowRating({required RatingModel item, required String role}) {
    _item = item;
    _role = role;
  }

  @override
  Widget build(BuildContext context) {
    return _item?.isSelected
        ? Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _role == "trainer"
                    ? ThemeColor.primaryColor
                    : ThemeColor.secondaryColor),
            child: Center(
              child: Text(
                "${_item?.value != 0 ? _item?.value : ""}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _role == "trainer"
                        ? ThemeColor.backgroundColor
                        : ThemeColor.primaryColor),
              ),
            ),
          )
        : Container(
            height: 30,
            width: 30,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: _role == "trainer"
                        ? ThemeColor.primaryColor
                        : ThemeColor.secondaryColor)),
            child: Center(
              child: Text(
                "${_item?.value != 0 ? _item?.value : ""}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: _role == "trainer"
                        ? ThemeColor.primaryColor
                        : ThemeColor.secondaryColor),
              ),
            ),
          );
  }
}
