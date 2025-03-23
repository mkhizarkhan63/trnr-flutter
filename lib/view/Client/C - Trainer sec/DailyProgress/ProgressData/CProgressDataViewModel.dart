import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/models/ProgressDataModel.dart';

import '../../../../../app/app.locator.dart';

class CProgressDataViewModel extends BaseViewModel {
  final progressData = [
    ProgressDataModel(date: "02 july, 2024", imageList: [
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false)
    ]),
    ProgressDataModel(date: "03 july, 2024", imageList: [
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false)
    ]),
    ProgressDataModel(date: "04 july, 2024", imageList: [
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false)
    ]),
    ProgressDataModel(date: "05 july, 2024", imageList: [
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false),
      ImageList(
          imageUrl: "https://dummyimage.com/600x400/0000ff/fff",
          isSelected: false)
    ])
  ];

  final navigationService = locator<NavigationService>();

  void selectImage(int dataIndex, int imagePosition) {
    for (var item in progressData[dataIndex].imageList) {
      item.isSelected = false;
    }

    progressData[dataIndex].imageList[imagePosition].isSelected = true;

    rebuildUi();
  }

  void navigateToCompareProgressDataView() {
    navigationService.navigateToCCompareProgressData();
  }
}
