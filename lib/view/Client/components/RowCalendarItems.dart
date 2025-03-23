import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowCalendarItems extends StatelessWidget {
  RowCalendarItems(
      {Key? key,
      required this.index,
      required this.startDate,
      required this.initialDate,
      required this.selectedDate,
      required this.textColor,
      required this.selectedColor,
      required this.backgroundColor,
      required this.locale,
      required this.onTap})
      : super(key: key);

  final int index;
  final DateTime startDate;
  final DateTime initialDate;
  final DateTime selectedDate;
  final Color textColor;
  final Color selectedColor;
  final Color backgroundColor;
  final Locale locale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    DateTime date = startDate.add(Duration(days: index));
    int diffDays = date.difference(selectedDate).inDays;
    int checkPastDate = date.difference(initialDate).inDays;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: (width / 100) * 12.5,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: diffDays != 0 ? backgroundColor : selectedColor),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                DateFormat.E(locale.toString()).format(date),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: diffDays != 0
                        ? checkPastDate >= 0
                            ? textColor
                            : Colors.grey[300]
                        : Colors.black),
              ),
              SizedBox(height: 2.0),
              Text(
                DateFormat.d(locale.toString()).format(date),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: diffDays != 0
                        ? checkPastDate >= 0
                            ? textColor
                            : Colors.grey[300]
                        : Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
