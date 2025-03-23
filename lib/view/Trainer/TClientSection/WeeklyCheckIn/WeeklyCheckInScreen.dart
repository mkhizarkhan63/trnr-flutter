import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../assets/variables/themeColor.dart';
import '../../../../models/TirednessModel.dart';
import '../../components/RowRating.dart';
import 'WeeklyCheckInViewModel.dart';

class WeeklyCheckInScreen extends StatelessWidget {
  const WeeklyCheckInScreen({super.key});

  final role = "trainer";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => WeeklyCheckInViewModel(),
        builder: (context, WeeklyCheckInViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
                child: Column(
              children: [_appBar(context), _forms(context, viewModel)],
            )),
          );
        });
  }

  Widget _appBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: ThemeColor.textfieldColor,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            "Weekly Check-in",
            style: TextStyle(
                color: ThemeColor.primaryColor,
                fontSize: 16,
                fontFamily: 'verdanab'),
          ),
        ),
      ],
    );
  }

  Widget _forms(BuildContext context, WeeklyCheckInViewModel viewModel) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              _dateField(viewModel),
              _textField("Commitment Rate", TextInputType.number, 45, 20,
                  viewModel.commitmentRateController, 10),
              _textField("How do you feel this week?", TextInputType.multiline,
                  100, 20, viewModel.howDoYouFeelController, 10),
              _textField(
                  "Would you like yo suggest or add something?",
                  TextInputType.multiline,
                  100,
                  20,
                  viewModel.suggestSomethingController,
                  10),
              _textField("Weight", TextInputType.number, 45, 20,
                  viewModel.weightController, 10),
              _textField("Hours of sleep", TextInputType.number, 45, 20,
                  viewModel.hourOfSleepController, 10),
              _qualityOfSleep(viewModel), // quality of sleep
              _pressure(viewModel), // pressure
              _tiredness(viewModel), // tiredness
              _hunger(viewModel), // hunger
              _recovery(viewModel), // recovery
              _dailyEnergy(viewModel), // daily energy
              _textField("Steps", TextInputType.number, 45, 20,
                  viewModel.stepsController, 10),
              _textField("Arm size", TextInputType.number, 45, 20,
                  viewModel.armSizeController, 10),
              _textField("Chest size", TextInputType.number, 45, 20,
                  viewModel.chestSizeController, 10),
              _textField("Stomach size", TextInputType.number, 45, 20,
                  viewModel.stomachSizeController, 10),
              _textField("Waist size", TextInputType.number, 45, 20,
                  viewModel.waistSizeController, 10),
              _textField("Thigh size", TextInputType.number, 45, 20,
                  viewModel.thighSizeController, 10),
              _uploadFSBPhotos(),
              _submitButton(context, viewModel)
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateField(WeeklyCheckInViewModel viewModel) {
    return Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            color: ThemeColor.textfieldColor,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: viewModel.todaysDate(),
          builder: (ctx, data) {
            return Text(
              data.data ?? "Select Date",
              style: const TextStyle(
                  fontSize: 14, color: ThemeColor.backgroundColor),
            );
          },
        ));
  }

  Widget _textField(
      String labelText,
      TextInputType keyboardType,
      double textFieldHeight,
      double marginTop,
      TextEditingController controller,
      int textLimit) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      width: double.infinity,
      height: textFieldHeight,
      decoration: BoxDecoration(
          color: ThemeColor.textfieldColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controller,
        maxLength: textLimit,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.black, fontSize: 14),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            hintText: labelText,
            counterText: "",
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none),
      ),
    );
  }

  Widget _submitButton(BuildContext context, WeeklyCheckInViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        if (viewModel.submitForm()) {
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
            child: Text(viewModel.formErrorMsg),
          )));
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: ThemeColor.textfieldColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Submit",
              style: TextStyle(
                  color: ThemeColor.backgroundColor, fontFamily: 'verdanab'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tiredness(WeeklyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          const Text(
            "Tiredness",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _tirednessValue(viewModel.tirednessList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _tirednessValue(
      List<RatingModel> data, WeeklyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markTiredness(index);
          },
          child: RowRating(item: item, role: role));
    });
  }

  Widget _pressure(WeeklyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          const Text(
            "Pressure",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _pressureValue(viewModel.pressureList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _pressureValue(
      List<RatingModel> data, WeeklyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markPressure(index);
          },
          child: RowRating(item: item, role: role));
    });
  }

  Widget _hunger(WeeklyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          const Text(
            "Hunger",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _hungerValue(viewModel.hungerList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _hungerValue(
      List<RatingModel> data, WeeklyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markHunger(index);
          },
          child: RowRating(item: item, role: role));
    });
  }

  Widget _recovery(WeeklyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          const Text(
            "Recovery",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _recoveryValue(viewModel.recoveryList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _recoveryValue(
      List<RatingModel> data, WeeklyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markRecovery(index);
          },
          child: RowRating(item: item, role: role));
    });
  }

  Widget _dailyEnergy(WeeklyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          const Text(
            "Daily energy",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      _dailyEnergyValue(viewModel.dailyEnergyList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _dailyEnergyValue(
      List<RatingModel> data, WeeklyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markDailyEnergy(index);
          },
          child: RowRating(item: item, role: role));
    });
  }

  Widget _qualityOfSleep(WeeklyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Wrap(
        children: [
          const Text(
            "Quality of sleep",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _qualityOfSleepValue(
                      viewModel.qualityOfSleepList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _qualityOfSleepValue(
      List<RatingModel> data, WeeklyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markQualityOfSleep(index);
          },
          child: RowRating(item: item, role: role));
    });
  }

  Widget _uploadFSBPhotos() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Photos(Front,Side,Back)",
            style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var result = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                      if (result == null) {
                        print("No file selected");
                      } else {}
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 80,
                          color: ThemeColor.textfieldColor,
                        ),
                        Text(
                          "Front",
                          style: TextStyle(
                              color: ThemeColor.textfieldColor, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var result = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                      if (result == null) {
                        print("No file selected");
                      } else {}
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 80,
                          color: ThemeColor.textfieldColor,
                        ),
                        Text(
                          "Side",
                          style: TextStyle(
                              color: ThemeColor.textfieldColor, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      var result = await FilePicker.platform
                          .pickFiles(allowMultiple: false);
                      if (result == null) {
                        print("No file selected");
                      } else {}
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 80,
                          color: ThemeColor.textfieldColor,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(
                              color: ThemeColor.textfieldColor, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
