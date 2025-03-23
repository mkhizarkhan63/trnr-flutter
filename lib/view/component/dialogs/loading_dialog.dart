import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class LoadingDialog extends StatelessWidget {
  final String message;

  const LoadingDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ThemeColor.textfieldColor,
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            color: ThemeColor.textfieldColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: ThemeColor.darkBackgroundColor,
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Text(
                message,
                style: const TextStyle(
                    fontSize: 18, color: ThemeColor.darkBackgroundColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
