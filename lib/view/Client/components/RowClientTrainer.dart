import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/trainer_model.dart';

class RowClientTrainer extends StatelessWidget {
  final String trainerData;
  final Function() onTrainerClick;

  const RowClientTrainer(
      {super.key, required this.trainerData, required this.onTrainerClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          InkWell(
            onTap: onTrainerClick,
            child: SizedBox(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: trainerData,
                // 'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.05,
                    backgroundImage: imageProvider,
                  );
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              "User 1",
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
