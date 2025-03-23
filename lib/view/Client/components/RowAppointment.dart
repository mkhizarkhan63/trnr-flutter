import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowAppointment extends StatelessWidget {
  String? day;
  String? month;
  String? role;

  RowAppointment(
      {super.key, required this.day, required this.month, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  color: role == "trainer"
                      ? ThemeColor.primaryColor
                      : ThemeColor.secondaryColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  day!.isNotEmpty ? day! : "",
                  style: TextStyle(
                    color: role == "trainer"
                        ? ThemeColor.primaryColor
                        : ThemeColor.secondaryColor,
                    fontSize: 14,
                  ),
                ),
                Text(
                  month!.isNotEmpty ? month! : "",
                  style: TextStyle(
                    color: role == "trainer"
                        ? ThemeColor.primaryColor
                        : ThemeColor.secondaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@Rashidalnimar',
                  style: TextStyle(
                    fontSize: 16,
                    color: role == "trainer"
                        ? ThemeColor.textfieldColor
                        : ThemeColor.darkBackgroundColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Chest day at Client\'s home',
                  style: TextStyle(
                    fontSize: 14,
                    color: role == "trainer"
                        ? ThemeColor.textColor
                        : ThemeColor.secondaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '10:00 pm',
                        style: TextStyle(
                          fontSize: 12,
                          color: role == "trainer"
                              ? ThemeColor.primaryColor
                              : Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Location',
                          style: TextStyle(
                            color: role == "trainer"
                                ? ThemeColor.primaryColor
                                : Colors.blue,
                            fontSize: 12,
                            decorationColor: role == "trainer"
                                ? ThemeColor.primaryColor
                                : Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
