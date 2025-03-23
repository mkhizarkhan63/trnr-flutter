import 'package:flutter/material.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

import '../../../assets/variables/themeColor.dart';
import '../../Trainer/components/RowSelectPersonalService.dart';
import '../../Trainer/components/RowSelectSpeciality.dart';

class SelectPersonalServiceBottomSheet extends StatefulWidget {
  SelectPersonalServiceBottomSheet(
      {super.key,
      required this.dataList,
      required this.role,
      required this.onItemClick});

  final List<PersonalTrainingData> dataList;
  final String role;
  final Function(List<PersonalTrainingData>) onItemClick;

  @override
  State<SelectPersonalServiceBottomSheet> createState() =>
      _SelectPersonalServiceBottomSheetState();
}

class _SelectPersonalServiceBottomSheetState
    extends State<SelectPersonalServiceBottomSheet> {
  List<PersonalTrainingData> selectedSpecialization = [];

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
                  "Personal Services",
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
                      child: Text("Please select personal services"),
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
                  final service = widget.dataList[index];
                  return RowSelectPersonalService(
                      service: service,
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
