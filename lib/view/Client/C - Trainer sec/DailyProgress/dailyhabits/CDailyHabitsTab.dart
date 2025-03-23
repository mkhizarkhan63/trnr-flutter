import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/components/RowDailyHabit.dart';

import 'CDailyHabitsViewModel.dart';

class CDailyHabitsTab extends StatelessWidget {
  CDailyHabitsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CDailyHabitsViewModel(),
      builder: (context, CDailyHabitsViewModel viewModel, index) {
        return SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${viewModel.selectedDay} - ${viewModel.lastDayOfWeek}",
                      style: const TextStyle(
                          color: ThemeColor.secondaryColor, fontSize: 14),
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewModel.previousDay();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: ThemeColor.secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: ThemeColor.textfieldColor,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          viewModel.nextDay();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: ThemeColor.secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: ThemeColor.textfieldColor,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    _days("Mon"),
                    _days("Tue"),
                    _days("Wed"),
                    _days("Thu"),
                    _days("Fri"),
                    _days("Sat"),
                    _days("Sun")
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: viewModel.data.length,
                    itemBuilder: (context, index) {
                      return RowDailyHabit(
                          model: viewModel.data[index], role: "client");
                    }),
              )
            ]),
          ),
        );
      },
    );
  }

  Expanded _days(String day) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          day,
          style:
              const TextStyle(color: ThemeColor.secondaryColor, fontSize: 12),
        ),
      ),
    );
  }
}
