import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TTraining/addTrainingSchefuleAlert/tAddTrainingScheduleAlert_viewModel.dart';

class TAddTrainingScheduleAlertView extends StatelessWidget {
  const TAddTrainingScheduleAlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TAddTrainingScheduleAlertViewModel(),
      builder: (context, TAddTrainingScheduleAlertViewModel viewModel, index) {
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
                    "Add Training Exercise",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Training Type',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                      ),
                      items: viewModel.trainingTypes.map((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        viewModel.trainingType = value!;
                      },
                    ),
                  ),
                ),
                buildTextField("Exercise Name", double.infinity, null, null,
                    viewModel.eNameController),
                buildTextField("Sets", double.infinity, null, null,
                    viewModel.setsController),
                buildTextField("Reps", double.infinity, null, null,
                    viewModel.repsController),
                buildTextField("Video Link", double.infinity, null, null,
                    viewModel.videoLinkController),
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
