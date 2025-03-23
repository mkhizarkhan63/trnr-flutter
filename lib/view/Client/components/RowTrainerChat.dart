import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowTrainerChat extends StatelessWidget {
  final String trainerName;
  final String message;
  final Function() onTrainerClick;

  const RowTrainerChat(
      {super.key,
      required this.trainerName,
      required this.message,
      required this.onTrainerClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTrainerClick,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ThemeColor.secondaryColor,
                width: 0.6,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl:
                      'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      radius: 32,
                      backgroundImage: imageProvider,
                    );
                  },
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trainerName,
                        style: const TextStyle(
                          color: ThemeColor.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          message,
                          style: const TextStyle(
                            color: ThemeColor.secondaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              )
            ],
          ),
        ));
  }
}
