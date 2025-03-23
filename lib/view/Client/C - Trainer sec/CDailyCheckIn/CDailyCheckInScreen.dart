import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/TirednessModel.dart';

import '../../../Trainer/components/RowRating.dart';
import 'CDailyCheckInViewModel.dart';

class CDailyCheckInScreen extends StatelessWidget {
  const CDailyCheckInScreen({super.key});

  final role = "client";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CDailyCheckInViewModel(),
        builder: (context, CDailyCheckInViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
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
              color: ThemeColor.secondaryColor,
            ),
          ),
        ),
        const Expanded(
          child: Text(
            "Daily Check-in",
            style: TextStyle(
                color: ThemeColor.secondaryColor,
                fontSize: 16,
                fontFamily: 'verdanab'),
          ),
        ),
      ],
    );
  }

  Widget _forms(BuildContext context, CDailyCheckInViewModel viewModel) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Wrap(
            children: [
              _dateField(viewModel),
              _textField(
                  "Amount of fluids (Water& drinks, atleast 2 times)",
                  TextInputType.number,
                  45,
                  20,
                  viewModel.amountOfFluidController,
                  10),
              _textField("Number of steps", TextInputType.number, 45, 20,
                  viewModel.numberOfStepsController, 10),
              _textField("Weight", TextInputType.number, 45, 20,
                  viewModel.weightController, 10),
              _tiredness(viewModel), // tiredness
              _pressure(viewModel), // pressure
              _strength(viewModel), // strength
              _hunger(viewModel), // hunger
              _recovery(viewModel), // recovery
              _dailyEnergy(viewModel), // daily energy
              _qualityOfSleep(viewModel), // quality of sleep
              _textField("Hours of sleep", TextInputType.number, 45, 20,
                  viewModel.hourOfSleepController, 10),
              _textField("Calories", TextInputType.number, 45, 20,
                  viewModel.caloriesController, 10),
              _textField("Notes", TextInputType.multiline, 100, 20,
                  viewModel.notesController, 150),
              _submitButton(context, viewModel)
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateField(CDailyCheckInViewModel viewModel) {
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
            builder: (context, snapshot) {
              return Text(snapshot.data ?? "Select Date");
            }));
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
        style: const TextStyle(color: Colors.black),
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

  Widget _submitButton(BuildContext context, CDailyCheckInViewModel viewModel) {
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
            color: ThemeColor.secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Submit",
              style: TextStyle(
                  color: ThemeColor.primaryColor, fontFamily: 'verdanab'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _tiredness(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Tiredness",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
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
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markTiredness(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }

  Widget _pressure(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Pressure",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
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
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markPressure(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }

  Widget _strength(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Strength",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _strengthValue(viewModel.strengthList, viewModel),
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> _strengthValue(
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markStrength(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }

  Widget _hunger(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Hunger",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
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
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markHunger(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }

  Widget _recovery(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Recovery",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
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
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markRecovery(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }

  Widget _dailyEnergy(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Daily energy",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
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
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markDailyEnergy(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }

  Widget _qualityOfSleep(CDailyCheckInViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Wrap(
        children: [
          const Text(
            "Quality of sleep",
            style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
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
      List<RatingModel> data, CDailyCheckInViewModel viewModel) {
    return List<Widget>.generate(data.length, (index) {
      RatingModel item = data[index];

      return GestureDetector(
          onTap: () {
            viewModel.markQualityOfSleep(index);
          },
          child: RowRating(
            item: item,
            role: role,
          ));
    });
  }
}
