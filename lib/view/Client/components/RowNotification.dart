import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RowNotification extends StatelessWidget {
  String? message;

  RowNotification({super.key, this.message});

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'verdanab')))
              ],
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}
