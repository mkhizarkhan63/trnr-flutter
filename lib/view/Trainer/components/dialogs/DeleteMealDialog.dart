import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class DeleteMealDialog extends StatelessWidget {
  final String mealName;
  final Function() onYesClick;

  const DeleteMealDialog(
      {super.key, required this.mealName, required this.onYesClick});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ThemeColor.textfieldColor,
            borderRadius: BorderRadius.circular(20)),
        child: Wrap(
          children: [
            Text(
              "Are you sure you want to delete $mealName?",
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onYesClick,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Yes",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ThemeColor.textfieldColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "No",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ThemeColor.textfieldColor, fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
