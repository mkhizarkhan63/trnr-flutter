import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trainr/models/ProgressDataModel.dart';

class RowProgressDataImage extends StatelessWidget {
  ImageList? _model;

  RowProgressDataImage({super.key, required ImageList model}) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: _model!.isSelected
          ? SizedBox(
              width: 100,
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                      imageUrl: _model!.imageUrl ?? ""),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: const Icon(
                        Icons.check_circle_outline,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          : SizedBox(
              width: 100,
              height: 50,
              child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                  imageUrl: _model!.imageUrl ?? ""),
            ),
    );
  }
}
