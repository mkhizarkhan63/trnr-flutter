import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/components/RowDailyHabit.dart';

import 'DailyHabitsViewModel.dart';

class DailyHabitsTab extends StatelessWidget {
  DailyHabitsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DailyHabitsViewModel(),
      builder: (context, DailyHabitsViewModel viewModel, index) {
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
                          color: ThemeColor.textfieldColor, fontSize: 14),
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
                              color: ThemeColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
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
                              color: ThemeColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
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
                        model: viewModel.data[index],
                        role: "trainer",
                      );
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
              const TextStyle(color: ThemeColor.textfieldColor, fontSize: 12),
        ),
      ),
    );
  }
}
