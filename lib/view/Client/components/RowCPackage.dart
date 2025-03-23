import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowCPackage extends StatelessWidget {
  final String sessions;
  final String price;
  final Function() onPackageClick;

  const RowCPackage(
      {super.key,
      required this.sessions,
      required this.price,
      required this.onPackageClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPackageClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ThemeColor.secondaryColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ThemeColor.secondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "$sessions sessions",
                      style: const TextStyle(
                          color: ThemeColor.textfieldColor, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'AED $price / session',
                      style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width / 25),
                        color: ThemeColor.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
