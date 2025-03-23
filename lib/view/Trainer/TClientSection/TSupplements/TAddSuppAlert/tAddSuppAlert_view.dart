import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TSupplements/TAddSuppAlert/tAddSuppAlert_viewModel.dart';

class TAddSuppAlertview extends StatelessWidget {
  const TAddSuppAlertview({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TAddSuppAlertViewModel(),
      builder: (context, TAddSuppAlertViewModel viewModel, index) {
        return AlertDialog(
          backgroundColor: ThemeColor.primaryColor,
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 1.6,
            child: SingleChildScrollView(
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
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Supplements List",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      children: List.generate(viewModel.supplementList.length,
                          (index) {
                        return Padding(
                          padding: EdgeInsets.all(0),
                          child: Center(
                            child: Text(
                              "* " + viewModel.supplementList[index]['name'],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40.0),
                    child: Text(
                      "Add Supplements",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  buildTextField("Supplement Name", double.infinity, null, null,
                      viewModel.sNameController),
                  buildTextField("Dosage", double.infinity, null, null,
                      viewModel.dossageController),
                  buildTextField("Time", double.infinity, null, null,
                      viewModel.timeController),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        viewModel.addSuppToList();
                      },
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
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
