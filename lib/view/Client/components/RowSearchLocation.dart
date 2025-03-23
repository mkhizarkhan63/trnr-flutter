import 'package:flutter/material.dart';

class RowSearchLocation extends StatelessWidget {
  final String name;
  final bool isSelected;
  final Function() onLocationClick;

  const RowSearchLocation(
      {super.key,
      required this.name,
      required this.isSelected,
      required this.onLocationClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLocationClick,
      child: Row(
        children: [
          Radio(
            value: name,
            groupValue: isSelected ? name : "",
            fillColor: const WidgetStatePropertyAll(Colors.black),
            onChanged: (String? value) {},
          ),
          Expanded(
              child: Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ))
        ],
      ),
    );
  }
}
