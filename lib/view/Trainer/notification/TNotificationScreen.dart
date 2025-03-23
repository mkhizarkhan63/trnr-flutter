import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../assets/variables/themeColor.dart';
import '../components/RowTNotification.dart';
import 'TNotificationViewModel.dart';

class TNotificationScreen extends StatelessWidget {
  const TNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TNotificationViewmodel(),
        builder: (context, TNotificationViewmodel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  Row(
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
                          "Notification",
                          style: TextStyle(
                              color: ThemeColor.primaryColor,
                              fontSize: 16,
                              fontFamily: 'verdanab'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: ThemeColor.textfieldColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: const Text(
                                "Clear All",
                                style:
                                    TextStyle(color: ThemeColor.textfieldColor),
                              ),
                            )),
                      ],
                    ),
                  ),
                  const Divider(
                    color: ThemeColor.textfieldColor,
                  ),
                  Flexible(
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, builder) {
                            return RowTNotification(
                              message: "ALGELI accepted you as their client",
                              onDeleteClick: () {},
                            );
                          }))
                ],
              ),
            ),
          );
        });
  }
}
