import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class CCompareProgressDataScreen extends StatelessWidget {
  const CCompareProgressDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColor.primaryColor,
        body: SafeArea(
            child: Column(
          children: [
            _appBar(context),
            const Divider(color: Colors.black),
            _photo("https://dummyimage.com/600x400/0000ff/fff"),
            const Divider(
              color: Colors.black,
            ),
            _photo("https://dummyimage.com/600x400/0000ff/fff")
          ],
        )));
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: ThemeColor.secondaryColor,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                "Compared Progress Data",
                style: TextStyle(
                    color: ThemeColor.secondaryColor,
                    fontSize: 16,
                    fontFamily: 'verdanab'),
              )),
        ],
      ),
    );
  }

  Widget _photo(String imageUrl) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageUrl: imageUrl),
      ),
    );
  }
}
