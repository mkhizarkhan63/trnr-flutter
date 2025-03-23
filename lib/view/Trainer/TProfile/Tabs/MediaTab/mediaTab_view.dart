import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/MediaTab/mediaTab_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowMedia.dart';
import 'package:trainr/view/Trainer/components/UploadPicVideoDialog.dart';
import '../../../../component/dialogs/loading_dialog.dart';

class MediaTabView extends StatelessWidget {
  MediaTabView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MediaTabViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getTrainerMedia(Constants.mediaTypePicture);
      },
      builder: (context, MediaTabViewModel viewModel, index) {
        return SingleChildScrollView(
          child: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: TabBar(
                            onTap: (index) async {
                              await viewModel.getTrainerMedia(index == 0
                                  ? Constants.mediaTypePicture
                                  : Constants.mediaTypeVideo);
                            },
                            padding: const EdgeInsets.all(0),
                            indicatorColor: ThemeColor.textfieldColor,
                            labelColor: Colors.transparent,
                            dividerColor: Colors.transparent,
                            tabs: const [
                              Text(
                                'Photos',
                                style: TextStyle(
                                  color: ThemeColor.textfieldColor,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Videos',
                                style: TextStyle(
                                  color: ThemeColor.textfieldColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            _showUploadPicVideoDialog(context, viewModel);
                          },
                          child: const Icon(
                            Icons.playlist_add_sharp,
                            size: 40,
                            color: ThemeColor.textfieldColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            viewModel.toggleEdit();
                          },
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: ThemeColor.textfieldColor,
                                fontSize: 18,
                                color: ThemeColor.textfieldColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 405,
                      width: double.infinity,
                      child: TabBarView(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: viewModel.picturesList.isNotEmpty
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemCount:
                                        viewModel.picturesList.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final picture =
                                          viewModel.picturesList[index];
                                      return RowMedia(
                                        imageUrl: picture.path ?? "",
                                        mediaType: picture.mediaType ?? 0,
                                        isEditable: viewModel.isEditable(),
                                        onDeleteClick: () async {
                                          _showLoader();

                                          final response = await viewModel
                                              .deleteTrainerMedia(
                                                  Constants.mediaTypePicture,
                                                  picture.id ?? 0);

                                          Navigator.pop(context);

                                          if (response?.statusCode == 200) {
                                            await viewModel.getTrainerMedia(
                                                Constants.mediaTypePicture);
                                          } else {
                                            _showError(
                                                response?.statusMessage ?? "");
                                          }
                                        },
                                      );
                                    },
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "No pictures added yet",
                                      style: TextStyle(
                                          color: ThemeColor.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: viewModel.videosList.isNotEmpty
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3),
                                    itemCount: viewModel.videosList.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final videos =
                                          viewModel.videosList[index];
                                      return RowMedia(
                                        imageUrl: videos.path ?? "",
                                        mediaType: videos.mediaType ?? 0,
                                        isEditable: viewModel.isEditable(),
                                        onDeleteClick: () async {
                                          _showLoader();

                                          final response = await viewModel
                                              .deleteTrainerMedia(
                                                  Constants.mediaTypeVideo,
                                                  videos.id ?? 0);

                                          Navigator.pop(context);

                                          if (response?.statusCode == 200) {
                                            await viewModel.getTrainerMedia(
                                                Constants.mediaTypeVideo);
                                          } else {
                                            _showError(
                                                response?.statusMessage ?? "");
                                          }
                                        },
                                      );
                                    },
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "No videos added yet",
                                      style: TextStyle(
                                          color: ThemeColor.primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showUploadPicVideoDialog(
      BuildContext context, MediaTabViewModel viewModel) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
              backgroundColor: ThemeColor.darkBackgroundColor,
              child: UploadPicVideoDialog(onUploadImage: () async {
                var result = await FilePicker.platform
                    .pickFiles(allowMultiple: false, type: FileType.image);
                if (result == null) {
                  print("No file selected");
                } else {
                  final imageFile = File(result.files.single.path ?? "");

                  _showLoader();

                  final response = await viewModel.uploadTrainerMedia(
                      Constants.mediaTypePicture, imageFile, null);

                  // to close the current dialog
                  Navigator.pop(context);

                  // to close the another dialog
                  Navigator.pop(ctx);

                  if (response?.statusCode == 200) {
                    await viewModel.getTrainerMedia(Constants.mediaTypePicture);
                  } else {
                    _showError(response?.statusMessage ?? "");
                  }
                }
              }, onUploadVideo: () async {
                var result = await FilePicker.platform
                    .pickFiles(allowMultiple: false, type: FileType.video);
                if (result == null) {
                  print("No file selected");
                } else {
                  final videoFile = File(result.files.single.path ?? "");

                  _showLoader();

                  final response = await viewModel.uploadTrainerMedia(
                      Constants.mediaTypeVideo, null, videoFile);

                  // to close the current dialog
                  Navigator.pop(context);

                  // to close the another dialog
                  Navigator.pop(ctx);

                  if (response?.statusCode == 200) {
                    await viewModel.getTrainerMedia(Constants.mediaTypeVideo);
                  } else {
                    _showError(response?.statusMessage ?? "");
                  }
                }
              }));
        });
  }

  _showLoader() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) {
          return const LoadingDialog(message: "Please wait....");
        });
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
