class ProgressDataModel {
  ProgressDataModel({
    required List<ImageList> imageList,
    String? date,
  }) {
    _imageList = imageList;
    _date = date;
  }

  ProgressDataModel.fromJson(dynamic json) {
    if (json['imageList'] != null) {
      _imageList = [];
      json['imageList'].forEach((v) {
        _imageList.add(ImageList.fromJson(v));
      });
    }
    _date = json['date'];
  }

  List<ImageList> _imageList = List.empty();
  String? _date;

  ProgressDataModel copyWith({
    required List<ImageList> imageList,
    String? date,
  }) =>
      ProgressDataModel(
        imageList: imageList ?? _imageList,
        date: date ?? _date,
      );

  List<ImageList> get imageList => _imageList;

  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_imageList != null) {
      map['imageList'] = _imageList.map((v) => v.toJson()).toList();
    }
    map['date'] = _date;
    return map;
  }
}

/// imageUrl : ""

class ImageList {
  ImageList({required String? imageUrl, required bool isSelected}) {
    _imageUrl = imageUrl;
    _isSelected = isSelected;
  }

  ImageList.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
  }

  String? _imageUrl;
  bool _isSelected = false;

  ImageList copyWith({String? imageUrl, bool isSelected = false}) =>
      ImageList(imageUrl: imageUrl ?? _imageUrl, isSelected: isSelected);

  set isSelected(bool value) {
    _isSelected = value;
  }

  String? get imageUrl => _imageUrl;

  bool get isSelected => _isSelected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    return map;
  }
}
