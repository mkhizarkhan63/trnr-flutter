import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../assets/variables/themeColor.dart';
import '../../../models/trainer_model.dart';

class RowTrainer extends StatelessWidget {
  final Trainer trainerData;
  final Function() onTrainerClick;

  const RowTrainer(
      {super.key, required this.trainerData, required this.onTrainerClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTrainerClick,
      child: ListTile(
        // leading: CircleAvatar(
        //   radius: 30,
        //   backgroundColor: Colors.white,
        // ),
        leading: Builder(builder: (context) {
          if (trainerData.userImg != null) {
            return CachedNetworkImage(
              fit: BoxFit.contain,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: trainerData.userImg!,
              // 'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.06,
                  backgroundImage: imageProvider,
                );
              },
            );
          } else {
            return CachedNetworkImage(
              fit: BoxFit.contain,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl:
                  'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
              imageBuilder: (context, imageProvider) {
                return CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.06,
                  backgroundImage: imageProvider,
                );
              },
            );
          }
        }),

        trailing: const Icon(
          Icons.favorite_border_outlined,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${trainerData.firstName} ${trainerData.lastName}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Icon(
                        Icons.verified_user,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Text(
                    // "Body building, crossfit, kick-boxing",
                    trainerData.specializations.join(","),
                    style: const TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            ),
                            // Text("4.7")
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(
                                "${trainerData.reviews != null ? trainerData.reviews?.length : 0}",
                                style: const TextStyle(
                                    color: ThemeColor.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "(34)",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Capacity:",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "11/20",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ThemeColor.secondaryColor,
                          ),
                          child: const Center(
                            child: Text(
                              "Online",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.right,
                          // "Abu Dhabi, united arab",
                          "${trainerData.residence} ${trainerData.nationality}",
                          style:
                              const TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
