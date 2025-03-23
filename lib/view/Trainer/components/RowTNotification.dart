import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowTNotification extends StatelessWidget {
  String? message;
  final Function() onDeleteClick;

  RowTNotification({super.key, this.message, required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(message ?? ""),
      background: Container(
        decoration: const BoxDecoration(color: Colors.red),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl:
                      'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.05,
                      backgroundImage: imageProvider,
                    );
                  },
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(message!,
                        style: const TextStyle(
                            color: ThemeColor.textfieldColor,
                            fontSize: 14,
                            fontFamily: 'verdanab')))
              ],
            ),
          ),
          const Divider(
            color: ThemeColor.textfieldColor,
          )
        ],
      ),
    );
  }
}
