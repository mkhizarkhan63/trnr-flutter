import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/models/GetSessionByUserResponse.dart';

import '../../../assets/variables/themeColor.dart';

class RowCTSession extends StatelessWidget {
  RowCTSession({super.key, required this.sessionData});

  SessionData sessionData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColor.primaryColor,
        border: Border.all(
          color: ThemeColor.fontColor,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            'Host',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ThemeColor.fontColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    sessionData.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: ThemeColor.fontColor,
                      decorationColor: ThemeColor.fontColor,
                      decoration: TextDecoration.combine([
                        TextDecoration.underline,
                      ]),
                    ),
                  ),
                ),
                const Icon(
                  Icons.pedal_bike,
                  size: 30,
                  color: ThemeColor.fontColor,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: ThemeColor.fontColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: AutoSizeText(sessionData.scheduledDate ?? "",
                            maxLines: 1,
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.alarm,
                        size: 20,
                        color: ThemeColor.fontColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          sessionData.scheduledTime ?? "",
                          style: const TextStyle(
                              color: ThemeColor.fontColor, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                      "Capacity: ${sessionData.participantCount}/${sessionData.totalCapacity}",
                      style: const TextStyle(
                          color: ThemeColor.fontColor, fontSize: 14)),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                        color: ThemeColor.fontColor,
                      ),
                      Container(
                        width: 120,
                        margin: const EdgeInsets.only(left: 5),
                        child: AutoSizeText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          sessionData.location?.locationName ?? "",
                          style: const TextStyle(
                              color: ThemeColor.fontColor, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          sessionData.link?.isNotEmpty == true
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.whatshot,
                        size: 25,
                        color: ThemeColor.fontColor,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          sessionData.link ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: ThemeColor.fontColor,
                            decoration: TextDecoration.combine([
                              TextDecoration.underline,
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
