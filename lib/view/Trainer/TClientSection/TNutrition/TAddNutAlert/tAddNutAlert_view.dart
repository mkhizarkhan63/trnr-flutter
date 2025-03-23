import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TClientSection/TNutrition/TAddNutAlert/tAddNutAlert_viewModel.dart';

class TAddNutAlertView extends StatelessWidget {
  const TAddNutAlertView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TAddNutAlertViewModel(),
      builder: (context, TAddNutAlertViewModel viewModel, index) {
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
                      "Nutrition Items List",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      children:
                          List.generate(viewModel.nutList.length, (index) {
                        return Padding(
                          padding: EdgeInsets.all(0),
                          child: Center(
                            child: Text(
                              "* " + viewModel.nutList[index]['name'],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 40.0),
                    child: Text(
                      "Add Nutritions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                    child: InkWell(
                      onTap: () async {
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: Theme.of(context).primaryColor,
                                  onPrimary: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (selectedDate != null) {
                          viewModel.selectDate(selectedDate);
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: viewModel.nutDateLabel ?? "Date of plan",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 12.0),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ),
                  ),
                  buildTextField("Name", double.infinity, null, null,
                      viewModel.sNameController),
                  buildTextField("Quantity", double.infinity, null, null,
                      viewModel.quantityController, true),
                  buildTextField("KCal", double.infinity, null, null,
                      viewModel.calController, true),
                  buildTextField("Protein", double.infinity, null, null,
                      viewModel.proteinController, true),
                  buildTextField("Carbs", double.infinity, null, null,
                      viewModel.carbController, true),
                  buildTextField("Fat", double.infinity, null, null,
                      viewModel.fatController, true),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () async {
                        viewModel.addNutToList();
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
                      onPressed: () async {
                        String msg = await viewModel.addSupplements();

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Center(
                          child: Text(msg),
                        )));
                        if (msg == "Success") {
                          viewModel.navigateToClientSection();
                        }
                      },
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
    TextEditingController? controller,
    bool? isNumbersOnly]) {
  rightPadding ??= 15;
  isNumbersOnly ??= false;
  if (isNumbersOnly) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 8, rightPadding, 8),
      child: Container(
        height: 45,
        width: width,
        child: TextFormField(
          obscureText: labelText.toLowerCase().contains('password'),
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  } else {
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
            contentPadding:
                EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
