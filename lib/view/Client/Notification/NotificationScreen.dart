import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/components/RowNotification.dart';

import '../../../assets/variables/themeColor.dart';
import 'NotificationViewModel.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => NotificationViewmodel(),
        builder: (context, NotificationViewmodel viewModel, index) {
          return Scaffold(
              backgroundColor: ThemeColor.primaryColor,
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
                            child: const Icon(Icons.arrow_back),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Notification",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'verdanab'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 0,
                                bottom: 0,
                              ),
                              decoration: BoxDecoration(
                                color: ThemeColor.textfieldColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.search),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Text(
                                "Clear All",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                    Flexible(
                        child: ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, builder) {
                              return RowNotification(
                                  message:
                                      "ALGELI accepted you as their client");
                            }))
                  ],
                ),
              ));
        });
  }
}
