import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';

class LanguagesBottomSheet extends StatefulWidget {
  final String title;
  final List<LanguageData> dataList;
  final String role;
  final Function(List<LanguageData>) onItemClick;

  LanguagesBottomSheet(
      {super.key,
      required this.title,
      required this.dataList,
      required this.role,
      required this.onItemClick});

  @override
  State<LanguagesBottomSheet> createState() => _LanguagesBottomSheetState();
}

class _LanguagesBottomSheetState extends State<LanguagesBottomSheet> {
  List<LanguageData> selectedLanguages = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: widget.role.toLowerCase() == "trainer"
                          ? ThemeColor.backgroundColor
                          : ThemeColor.primaryColor,
                      fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.dataList.forEach((data) {
                    if (data.isSelected) {
                      selectedLanguages.add(data);
                    }
                  });

                  if (selectedLanguages.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(
                      child: Text("Please select languages"),
                    )));
                  } else {
                    Navigator.pop(context);
                    widget.onItemClick(selectedLanguages);
                  }
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                      color: widget.role.toLowerCase() == "trainer"
                          ? ThemeColor.backgroundColor
                          : ThemeColor.primaryColor,
                      fontSize: 18),
                ),
              )
            ]),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: false,
                itemCount: widget.dataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.dataList[index].isSelected =
                            !widget.dataList[index].isSelected;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: widget.dataList[index].isSelected
                          ? Text(
                              widget.dataList[index].name ?? "",
                              style: const TextStyle(color: Colors.green),
                            )
                          : Text(widget.dataList[index].name ?? ""),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
