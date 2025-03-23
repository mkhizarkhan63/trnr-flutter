import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetAllSessionResponse.dart';

import '../../../models/CommunityModel.dart';

class RowCommunity extends StatelessWidget {
  final AllSessionData data;
  final Function() onCommunityClick;

  const RowCommunity(
      {super.key, required this.data, required this.onCommunityClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onCommunityClick,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.pedal_bike,
                    size: 50,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title ?? "",
                            style: const TextStyle(
                              color: ThemeColor.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Text(
                              data.trainerId != null
                                  ? "By coach ${data.trainer}"
                                  : "By coach ${data.client}",
                              style: const TextStyle(
                                color: ThemeColor.secondaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
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
                                          data.scheduledDate ?? "",
                                          style: const TextStyle(
                                              color: ThemeColor.secondaryColor,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.alarm,
                                        size: 20,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          data.scheduledTime ?? "",
                                          style: const TextStyle(
                                              color: ThemeColor.secondaryColor,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Capacity: ${data.participantCount ?? 0}/${data.totalCapacity ?? 0}",
                                    style: const TextStyle(
                                        color: ThemeColor.secondaryColor,
                                        fontSize: 12),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        width: 100,
                                        margin: const EdgeInsets.only(left: 5),
                                        child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            data.location?.locationName ?? "",
                                            style: const TextStyle(
                                                color:
                                                    ThemeColor.secondaryColor,
                                                fontSize: 12)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.sports,
                    size: 50,
                  ),
                ],
              ),
              const Divider()
            ],
          ),
        ));
  }
}
