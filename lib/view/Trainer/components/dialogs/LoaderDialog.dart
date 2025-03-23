import 'package:flutter/material.dart';

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
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: const Wrap(
          children: [
            CircularProgressIndicator(),
            Text(
              "Please wait.....",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
