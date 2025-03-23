import 'package:stacked/stacked.dart';
import 'package:table_calendar/table_calendar.dart';

class ClientCalendarViewModel extends BaseViewModel {
  late DateTime? selectedDay = DateTime.now();
  late DateTime focusedDay = DateTime.now();
  List<Appointment> selectedApt = [];

  List weekDays = ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'];
  List months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  Map appointments = {
    '2024, 1, 17': [
      const Appointment('Iqbal Ghazi'),
      const Appointment('Iqbal Ghazi'),
      const Appointment('Iqbal Ghazi'),
      const Appointment('Iqbal Ghazi'),
      const Appointment('Iqbal Ghazi'),
      const Appointment('Iqbal Ghazi')
    ],
    '2024, 1, 14': [const Appointment('Iqbal Ghazi')],
  };

  sameDayCheck(
      {required DateTime selectedDate, required DateTime focusedDate}) {
    if (!isSameDay(selectedDay, selectedDate)) {
      selectedDay = selectedDate;
      focusedDay = focusedDate;
      selectedApt = getEventsForDay(selectedDate);

      rebuildUi();
    }
  }

  List<Appointment> getEventsForDay(DateTime day) {
    return appointments['${day.year}, ${day.month}, ${day.day}'] ?? [];
  }
}

class Appointment {
  final String title;

  const Appointment(this.title);

  @override
  String toString() => title;
}
