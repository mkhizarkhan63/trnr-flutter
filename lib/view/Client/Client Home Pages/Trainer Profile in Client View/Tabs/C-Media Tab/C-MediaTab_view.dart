import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-Media%20Tab/C-MediaTab_ViewModel.dart';
import 'package:trainr/view/Trainer/components/RowMedia.dart';

import '../../../../../../utils.dart';

class CMediaTabView extends StatelessWidget {
  CMediaTabView({super.key, required this.trainerId});

  int trainerId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CMediatabviewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getTrainerMedia(
              trainerId, Constants.mediaTypePicture);
        },
        builder: (context, CMediatabviewModel viewModel, index) {
          return DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TabBar(
                            onTap: (index) async {
                              await viewModel.getTrainerMedia(
                                  trainerId,
                                  index == 0
                                      ? Constants.mediaTypePicture
                                      : Constants.mediaTypeVideo);
                            },
                            padding: const EdgeInsets.all(0),
                            labelColor: Colors.black,
                            indicatorColor: Colors.black,
                            dividerColor: ThemeColor.primaryColor,
                            tabs: const [
                              Text(
                                'Photos',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Videos',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
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
                                          isEditable: false,
                                          onDeleteClick: () async {},
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
                                      itemCount:
                                          viewModel.videosList.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final videos =
                                            viewModel.videosList[index];
                                        return RowMedia(
                                          imageUrl: videos.path ?? "",
                                          mediaType: videos.mediaType ?? 0,
                                          isEditable: false,
                                          onDeleteClick: () async {},
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
                  ),
                ],
              ),
            ),
          );
        });
  }
}
