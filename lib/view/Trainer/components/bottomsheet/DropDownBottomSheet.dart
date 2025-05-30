import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class DropDownBottomSheet extends StatelessWidget {
  final String title;
  final List<String?> dataList;
  final String role;
  final Function(String) onItemClick;

  const DropDownBottomSheet(
      {super.key,
      required this.title,
      required this.dataList,
      required this.role,
      required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: role.toLowerCase() == "trainer"
                      ? ThemeColor.backgroundColor
                      : ThemeColor.primaryColor,
                  fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        onItemClick(dataList[index] ?? "");
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(dataList[index] ?? ""),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
