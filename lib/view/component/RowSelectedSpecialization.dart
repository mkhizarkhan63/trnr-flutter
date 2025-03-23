import 'package:flutter/material.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

class RowSelectedSpecialization extends StatelessWidget {
  SpecializationData specialization;
  Function(SpecializationData) onDeleteClick;

  RowSelectedSpecialization(this.specialization, this.onDeleteClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                onDeleteClick(specialization);
              },
              child: const Icon(
                Icons.remove_circle_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
