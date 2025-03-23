import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetGenderResponse.dart';

class GenderBottomSheet extends StatelessWidget {
  final String title;
  final List<GenderData> dataList;
  final String role;
  final Function(GenderData) onItemClick;

  const GenderBottomSheet(
      {super.key,
      required this.title,
      required this.dataList,
      required this.role,
      required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ListView.builder(
              shrinkWrap: true,
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    onItemClick(dataList[index]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(dataList[index].gender ?? ""),
                  ),
                );
              })
        ],
      ),
    );
  }
}
