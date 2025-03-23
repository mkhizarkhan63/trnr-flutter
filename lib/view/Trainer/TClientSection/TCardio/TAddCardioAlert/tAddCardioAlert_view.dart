import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TCardio/TAddCardioAlert/tAddCardioAlert_viewModel.dart';

class TAddCardioAlertView extends StatelessWidget {
  const TAddCardioAlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TAddCardioAlertViewModel(),
      builder: (context, TAddCardioAlertViewModel viewModel, index) {
        return AlertDialog(
          backgroundColor: ThemeColor.primaryColor,
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Align(
                //   alignment:
                //       Alignment.centerRight,
                //   child: IconButton(
                //     style: IconButton
                //         .styleFrom(
                //             backgroundColor:
                //                 Colors
                //                     .black),
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.close,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Text(
                    "Add Cardio",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                buildTextField("Cardio Name", double.infinity, null, null,
                    viewModel.cNameController),
                buildTextField("Days", double.infinity, null, null,
                    viewModel.daysController),
                buildTextField("Time", double.infinity, null, null,
                    viewModel.timeController),
                buildTextField("Rounds", double.infinity, null, null,
                    viewModel.roundController),
                buildTextField("Rest", double.infinity, null, null,
                    viewModel.restController),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () async {},
                    child: viewModel.btnEle,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget buildTextField(String labelText, double width,
    [Widget? suffixIcon,
    double? rightPadding,
    TextEditingController? controller]) {
  rightPadding ??= 15;
  return Padding(
    padding: EdgeInsets.fromLTRB(15, 8, rightPadding, 8),
    child: Container(
      height: 45,
      width: width,
      child: TextFormField(
        obscureText: labelText.toLowerCase().contains('password'),
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
          suffixIcon: suffixIcon,
        ),
      ),
    ),
  );
}
