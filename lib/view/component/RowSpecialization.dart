import 'package:flutter/material.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

class RowSpecialization extends StatelessWidget {
  SpecializationData specialization;
  Function(SpecializationData) onSpecializationClick;

  RowSpecialization(this.specialization, this.onSpecializationClick);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSpecializationClick(specialization);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 15.0,
          bottom: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white30,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                specialization.name ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
