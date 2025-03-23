import 'package:flutter/material.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

import '../../../assets/variables/themeColor.dart';
import '../../Trainer/components/RowSelectSpeciality.dart';

class SelectSpecializationBottomSheet extends StatefulWidget {
  SelectSpecializationBottomSheet(
      {super.key,
      required this.dataList,
      required this.role,
      required this.onItemClick});

  final List<SpecializationData> dataList;
  final String role;
  final Function(List<SpecializationData>) onItemClick;

  @override
  State<SelectSpecializationBottomSheet> createState() =>
      _SelectSpecializationBottomSheetState();
}

class _SelectSpecializationBottomSheetState
    extends State<SelectSpecializationBottomSheet> {
  List<SpecializationData> selectedSpecialization = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (var value in widget.dataList) {
      value.isSelected = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(children: [
              Expanded(
                child: Text(
                  "Specialization",
                  style: TextStyle(
                      color: widget.role.toLowerCase() == "trainer"
                          ? ThemeColor.textfieldColor
                          : ThemeColor.fontColor,
                      fontSize: 20),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.dataList.forEach((data) {
                    if (data.isSelected) {
                      selectedSpecialization.add(data);
                    }
                  });

                  if (selectedSpecialization.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Center(
                      child: Text("Please select specialization"),
                    )));
                  } else {
                    Navigator.pop(context);
                    widget.onItemClick(selectedSpecialization);
                  }
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                      color: widget.role.toLowerCase() == "trainer"
                          ? ThemeColor.textfieldColor
                          : ThemeColor.fontColor,
                      fontSize: 18),
                ),
              )
            ]),
          ),
          Expanded(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(widget.dataList.length, (index) {
                  final specialization = widget.dataList[index];
                  return RowSelectSpeciality(
                      speciality: specialization,
                      onSpecialityClick: () {
                        setState(() {
                          widget.dataList[index].isSelected =
                              !widget.dataList[index].isSelected;
                        });
                      },
                      role: widget.role);
                })),
          )
        ]),
      ),
    );
  }
}
