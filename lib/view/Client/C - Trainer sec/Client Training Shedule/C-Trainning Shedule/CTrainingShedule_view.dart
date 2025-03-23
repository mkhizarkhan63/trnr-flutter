import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Training%20Shedule/C-Trainning%20Shedule/CTrainingShedule_viewModel.dart';

class CTrainingSheduleView extends StatelessWidget {
  const CTrainingSheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CTrainingSheduleViewModel(),
        builder: (context, CTrainingSheduleViewModel viewModel, index) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
              child: Wrap(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: ThemeColor.secondaryColor,
                            ),
                          ),
                          Text(
                            "",
                            style: const TextStyle(
                              fontSize: 20,
                              color: ThemeColor.secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: ThemeColor.secondaryColor,
                ),
                /*FutureBuilder(
                    future: viewModel.getTrainingData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return const Wrap(
                          children: [
                            DefaultTabController(
                              length: 4,
                              child: Column(
                                children: [
                                  TabBar(
                                    padding: EdgeInsets.all(0),
                                    labelPadding: EdgeInsets.all(0),
                                    indicatorColor: ThemeColor.secondaryColor,
                                    tabs: [
                                      Text(
                                        "Push",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.secondaryColor),
                                      ),
                                      Text(
                                        "Pull",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.secondaryColor),
                                      ),
                                      Text(
                                        "Legs",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.secondaryColor),
                                      ),
                                      Text(
                                        "Full body",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: ThemeColor.secondaryColor),
                                      ),
                                      // Icon(
                                      //   Icons.edit,
                                      //   size: 20,
                                      //   color: Colors.black,
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 500,
                                    width: double.infinity,
                                    child: TabBarView(
                                      children: [
                                        PushTabView(),
                                        PullTabView(),
                                        LegTabView(),
                                        FullBodyTabView(),
                                        // PackagesTabView(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("No training schedule found"),
                        );
                      }
                    }),*/
              ]),
            ),
          );
        });
  }
}
