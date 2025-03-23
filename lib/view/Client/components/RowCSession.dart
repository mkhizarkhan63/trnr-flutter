import 'package:flutter/material.dart';
import 'package:trainr/models/GetSessionByUserResponse.dart';

import '../../../assets/variables/themeColor.dart';

class RowCSession extends StatelessWidget {
  RowCSession(
      {super.key, required this.sessionData, required this.onSessionCancelTap});

  SessionData sessionData;
  Function() onSessionCancelTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  sessionData.title ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.combine([
                      TextDecoration.underline,
                    ]),
                  ),
                ),
              ),
              const Icon(
                Icons.pedal_bike,
                size: 40,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
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
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            sessionData.scheduledDate ?? "",
                            style: const TextStyle(
                                color: ThemeColor.secondaryColor, fontSize: 14),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.alarm,
                        size: 20,
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            sessionData.scheduledTime ?? "",
                            style: const TextStyle(
                                color: ThemeColor.secondaryColor, fontSize: 14),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Capacity: ${sessionData.participantCount}/${sessionData.totalCapacity}",
                style: const TextStyle(
                    color: ThemeColor.secondaryColor, fontSize: 14),
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.white,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        sessionData.location?.locationName ?? "",
                        style: const TextStyle(
                            fontSize: 14, color: ThemeColor.secondaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          sessionData.link?.isNotEmpty == true
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.phone_rounded,
                        size: 20,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            sessionData.link ?? "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeColor.secondaryColor,
                              fontSize: 14,
                              decoration: TextDecoration.combine([
                                TextDecoration.underline,
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.secondaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  onSessionCancelTap();
                },
                child: const Text(
                  'Cancel Session',
                  style: TextStyle(
                    fontSize: 14,
                    color: ThemeColor.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
