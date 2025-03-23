import 'package:flutter/material.dart';

import '../../../assets/variables/themeColor.dart';

class RowClientPersonalService extends StatelessWidget {
  String serviceName;
  final bool isEditable;
  final Function() onDeleteClick;

  RowClientPersonalService(
      {super.key,
      required this.serviceName,
      required this.isEditable,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeColor.textfieldColor),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                serviceName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              isEditable
                  ? _deleteButton()
                  : const SizedBox(
                      height: 5,
                    )
            ],
          )),
    );
  }

  Widget _deleteButton() {
    return GestureDetector(
      onTap: onDeleteClick,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        alignment: Alignment.center,
        child: const Icon(
          Icons.close,
          size: 20,
          color: Colors.red,
        ),
      ),
    );
  }
}
