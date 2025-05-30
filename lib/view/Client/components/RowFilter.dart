import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/LocationModel.dart';

class RowFilter extends StatelessWidget {
  final LocationModel data;
  final Function() onFilterOptionClick;

  const RowFilter(
      {super.key, required this.data, required this.onFilterOptionClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onFilterOptionClick,
        child: Row(
          children: [
            Expanded(
              child: Text(
                data.locationName,
                style: const TextStyle(
                    color: ThemeColor.secondaryColor, fontSize: 16),
              ),
            ),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: data.isSelected
                        ? ThemeColor.secondaryColor
                        : ThemeColor.primaryColor,
                    border: Border.all(color: ThemeColor.secondaryColor),
                    borderRadius: BorderRadius.circular(2)),
                child: data.isSelected
                    ? const Icon(
                        Icons.check,
                        color: ThemeColor.primaryColor,
                        size: 20,
                      )
                    : const Icon(
                        Icons.check,
                        color: ThemeColor.primaryColor,
                        size: 20,
                      ))
          ],
        ),
      ),
    );
  }
}
