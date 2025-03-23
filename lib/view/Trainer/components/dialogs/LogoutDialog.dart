import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class LogoutDialog extends StatelessWidget {
  final Function() onLogoutClick;

  const LogoutDialog({super.key, required this.onLogoutClick});

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
            const Text(
              "Are you sure you want to logout?",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onLogoutClick,
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Logout",
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
                          "Cancel",
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
