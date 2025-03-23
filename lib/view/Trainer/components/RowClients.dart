import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowClients extends StatelessWidget {
  final String clientName;
  final Function() onClientClick;

  const RowClients(
      {super.key, required this.clientName, required this.onClientClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClientClick,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ThemeColor.textfieldColor,
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
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Text(
                  clientName,
                  style: const TextStyle(
                    color: ThemeColor.primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
