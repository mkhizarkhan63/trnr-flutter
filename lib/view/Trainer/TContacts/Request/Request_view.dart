import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TContacts/Request/Request_viewModel.dart';

class RequestView extends StatelessWidget {
  const RequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => RequestViewModel(),
        builder: (context, RequestViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ThemeColor.textfieldColor,
                  )),
              backgroundColor: ThemeColor.backgroundColor,
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rasheed Al Sarkal",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.primaryColor),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor.textfieldColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.05,
                            horizontal: MediaQuery.of(context).size.width * 0.2,
                          )),
                      child: Text(
                        "Accept",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: ThemeColor.backgroundColor),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * 0.1),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ThemeColor.textfieldColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.05,
                            horizontal: MediaQuery.of(context).size.width * 0.2,
                          )),
                      child: Text(
                        "Decline",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: ThemeColor.backgroundColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
