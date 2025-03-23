import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/components/RowCalendarItems.dart';

typedef OnDateSelected(DateTime date);

class CustomHorizontalCalendar extends StatefulWidget {
  CustomHorizontalCalendar(
      {super.key, required this.locale, required this.onDateSelected});

  final Locale locale;
  final OnDateSelected onDateSelected;

  @override
  State<CustomHorizontalCalendar> createState() =>
      _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  DateTime _startDate = DateTime.now();

  var _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _startDate = _selectedDate.subtract(const Duration(days: 3));

    return Container(
      color: Colors.black,
      height: 100,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.all(0.0),
        title: Text(
          DateFormat.yMMM(widget.locale.toString()).format(_selectedDate),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white),
        ),
        subtitle: Container(
          color: Colors.black,
          padding: EdgeInsets.all(5),
          child: Row(children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 7,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return RowCalendarItems(
                    index: index,
                    startDate: _startDate,
                    initialDate: _selectedDate,
                    selectedDate: _selectedDate,
                    textColor: Colors.white,
                    selectedColor: ThemeColor.primaryColor,
                    backgroundColor: Colors.black,
                    locale: widget.locale,
                    onTap: () {
                      onDatePressed(index, _selectedDate);
                      print("babar: working");
                    },
                  );
                },
              ),
            ),
            const Icon(
              Icons.calendar_today,
              color: Colors.white,
            )
          ]),
        ),
      ),
    );
  }

  void onDatePressed(int index, DateTime? initialDate) {
    DateTime date = _startDate.add(Duration(days: index));
    // int diffDays = date.difference(selectedDate).inDays;
    int checkDate = date.difference(_startDate).inDays;
    if (checkDate >= 0) {
      widget.onDateSelected(date);
      setState(() {
        _selectedDate = _startDate.add(Duration(days: index));
        _startDate = _startDate.add(Duration(days: index));
      });
    }
  }
}
