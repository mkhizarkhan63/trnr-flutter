import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:video_thumbnail_imageview/video_thumbnail_imageview.dart';

import '../../../utils.dart';

class RowMedia extends StatelessWidget {
  final String imageUrl;
  final bool isEditable;
  final int mediaType;
  final Function() onDeleteClick;

  const RowMedia(
      {super.key,
      required this.imageUrl,
      required this.isEditable,
      required this.mediaType,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 60,
        height: 60,
        child: Stack(
          fit: StackFit.expand,
          children: [
            mediaType == Constants.mediaTypePicture
                ? CachedNetworkImage(
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: imageUrl,
                  )
                : VTImageView(
                    videoUrl: imageUrl,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stack) {
                      return const Icon(Icons.error);
                    },
                    assetPlaceHolder: '',
                  ),
            isEditable
                ? Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      color: ThemeColor.textfieldColor,
                      onPressed: () {
                        onDeleteClick();
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
