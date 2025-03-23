import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';

class RowService extends StatelessWidget {
  final String serviceName;
  final String role;

  const RowService({super.key, required this.serviceName, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: role == "trainer"
              ? ThemeColor.textfieldColor
              : ThemeColor.fontColor,
        ),
        child: Center(
          child: Text(
            serviceName,
            style: TextStyle(
                color: role == "trainer"
                    ? ThemeColor.backgroundColor
                    : ThemeColor.fontColor,
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}
