import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TCalendar/tCalendar_viewModel.dart';

import '../../Client/components/RowAppointment.dart';

class TCalendarView extends StatelessWidget {
  const TCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TCalendarViewModel(),
      builder: (context, TCalendarViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                _appBar(),
                _calenderView(context, viewModel),
                _appointmentList(context, viewModel)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _appBar() {
    return const Column(
      children: [
        Text(
          "Calendar",
          style: TextStyle(
              color: ThemeColor.textfieldColor,
              fontSize: 24,
              fontFamily: 'verdanab'),
        ),
        Divider(
          color: ThemeColor.textfieldColor,
        )
      ],
    );
  }

  Widget _calenderView(BuildContext context, TCalendarViewModel viewModel) {
    return TableCalendar(
      focusedDay: viewModel.focusedDay,
      firstDay: DateTime.utc(2020, 01, 01),
      lastDay: DateTime.utc(2050, 12, 31),
      headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(
            Icons.arrow_back_ios,
            color: ThemeColor.textfieldColor,
          ),
          rightChevronIcon: Icon(
            Icons.arrow_forward_ios,
            color: ThemeColor.textfieldColor,
          )),
      calendarStyle: const CalendarStyle(
        outsideDaysVisible: false,
        isTodayHighlighted: false,
        markersAlignment: Alignment.center,
        markersOffset: PositionedOffset(
          top: 0,
        ),
        markersMaxCount: 1,
        markersAutoAligned: false,
      ),
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, day, focusedDay) {
          return _selectedDay(day.day.toString());
        },
        defaultBuilder: (context, day, focusedDay) {
          return _day(day.day.toString());
        },
        headerTitleBuilder: (context, day) {
          return _headerTitle(
              '${viewModel.months[day.month - 1]} ${day.year - 2000}');
        },
        dowBuilder: (context, day) {
          return _dowText('${viewModel.weekDays[day.weekday - 1]}');
        },
        singleMarkerBuilder: (context, day, event) {
          return _markEvent();
        },
      ),
      eventLoader: (day) {
        return viewModel.getEventsForDay(day);
      },
      selectedDayPredicate: (day) {
        return isSameDay(viewModel.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        viewModel.sameDayCheck(
            selectedDate: selectedDay, focusedDate: focusedDay);
      },
    );
  }

  Widget _day(String day) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            day,
            style: const TextStyle(
              fontSize: 14,
              color: ThemeColor.textfieldColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectedDay(String day) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeColor.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            day,
            style: const TextStyle(
              fontSize: 14,
              color: ThemeColor.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerTitle(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          color: ThemeColor.textfieldColor,
        ),
      ),
    );
  }

  Widget _dowText(String dow) {
    return Center(
      child: Text(
        dow,
        style: const TextStyle(
          fontSize: 15,
          color: ThemeColor.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _markEvent() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ThemeColor.textfieldColor,
            )),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _appointmentList(BuildContext context, TCalendarViewModel viewModel) {
    return viewModel.selectedApt.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.selectedApt.length,
              itemBuilder: (context, index) {
                return RowAppointment(
                  day: "${viewModel.selectedDay!.day}",
                  month: "${viewModel.months[viewModel.selectedDay!.month]}",
                  role: "trainer",
                );
              },
            ),
          )
        : Expanded(
            child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "No event added",
                  style: TextStyle(
                      fontSize: 20,
                      color: ThemeColor.primaryColor,
                      fontFamily: 'verdanab'),
                )),
          );
  }
}
