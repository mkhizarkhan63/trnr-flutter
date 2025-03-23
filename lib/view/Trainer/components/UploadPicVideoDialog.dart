import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class UploadPicVideoDialog extends StatelessWidget {
  final Function() onUploadImage;
  final Function() onUploadVideo;

  const UploadPicVideoDialog(
      {super.key, required this.onUploadImage, required this.onUploadVideo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: ThemeColor.textfieldColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "No file selected",
              style: TextStyle(fontSize: 16, color: ThemeColor.textfieldColor),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: onUploadImage,
              style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.textfieldColor),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Upload Image",
                  style: TextStyle(
                      fontSize: 17,
                      color: ThemeColor.darkBackgroundColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: onUploadVideo,
              style: ElevatedButton.styleFrom(
                  backgroundColor: ThemeColor.textfieldColor),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Upload Video",
                  style: TextStyle(
                      fontSize: 17,
                      color: ThemeColor.darkBackgroundColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
