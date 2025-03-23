import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/components/button.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Client%20Home/C-BookSpot_view.dart/CBookSpot_viewModel.dart';

class CBookSpotView extends StatelessWidget {
  const CBookSpotView({super.key});

  @override
  Widget build(BuildContext context) {
    const String role = "client";
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CBookSpotViewModel(),
        builder: (context, CBookSpotViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            appBar: AppBar(
              backgroundColor: ThemeColor.primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: SafeArea(
                child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: const Icon(
                    Icons.pedal_bike,
                    size: 100,
                  ),
                ),
                Text(
                  viewModel.clientData.sessionData?.title ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  "By coach ${viewModel.clientData.sessionData?.trainerId != null ? viewModel.clientData.sessionData?.trainer : viewModel.clientData.sessionData?.client}",
                  style: const TextStyle(fontSize: 18),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      color: ThemeColor.secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.credit_card,
                                  size: 20,
                                  color: ThemeColor.textfieldColor,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    "${viewModel.clientData.sessionData?.price} AED",
                                    style: const TextStyle(
                                        color: ThemeColor.textfieldColor,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.class_,
                                size: 20,
                                color: ThemeColor.textfieldColor,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                  viewModel.clientData.sessionData?.classType ??
                                      "",
                                  style: const TextStyle(
                                      color: ThemeColor.textfieldColor,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 20,
                                    color: ThemeColor.textfieldColor,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text(
                                        viewModel.clientData.sessionData
                                                ?.scheduledDate ??
                                            "",
                                        style: const TextStyle(
                                            color: ThemeColor.textfieldColor,
                                            fontSize: 18)),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.alarm,
                                  size: 20,
                                  color: ThemeColor.textfieldColor,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Text(
                                      viewModel.clientData.sessionData
                                              ?.scheduledTime ??
                                          "",
                                      style: const TextStyle(
                                          color: ThemeColor.textfieldColor,
                                          fontSize: 18)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              const Icon(
                                Icons.people,
                                size: 20,
                                color: ThemeColor.textfieldColor,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                    "${viewModel.clientData.sessionData?.participantCount}/${viewModel.clientData.sessionData?.totalCapacity}",
                                    style: const TextStyle(
                                        color: ThemeColor.textfieldColor,
                                        fontSize: 18)),
                              ),
                            ],
                          )),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 20,
                                color: ThemeColor.textfieldColor,
                              ),
                              Container(
                                width: 150,
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(
                                    viewModel.clientData.sessionData?.location
                                            ?.locationName ??
                                        "",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: ThemeColor.textfieldColor,
                                        fontSize: 18)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                viewModel.clientData.sessionData?.link?.isNotEmpty == true
                    ? Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 60),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: ThemeColor.secondaryColor,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                      "https/trainerapp/adriod/ios",
                                      style: TextStyle(
                                          color: ThemeColor.textColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: ThemeColor.textColor,
                                          fontSize: 18)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 40, right: 40, bottom: 20),
                  child: MyButton(onTap: () {}, role: role, text: "Book Spot"),
                ),
              ],
            )),
          );
        });
  }
}
