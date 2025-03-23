/// statuscode : 200
/// status : "success"
/// message : "Fetched Successfully!"
/// data : {"trainerId":30,"trainerMedia":[{"Path":"http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731065320584-JPEG_20241108_162839_8332753072367505091.jpg","MediaType":1},{"Path":"http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731065482087-JPEG_20241108_163120_2439358835065697166.jpg","MediaType":1},{"Path":"http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731068974816-JPEG_20241108_172931_4001335386949709052.jpg","MediaType":1}]}

class GetTrainerMediaResponse {
  GetTrainerMediaResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? TrainerMediaData.fromJson(json['data']) : null;
  }

  num? _statuscode;
  String? _status;
  String? _message;
  TrainerMediaData? _data;

  num? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  TrainerMediaData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = _statuscode;
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// trainerId : 30
/// trainerMedia : [{"Path":"http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731065320584-JPEG_20241108_162839_8332753072367505091.jpg","MediaType":1},{"Path":"http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731065482087-JPEG_20241108_163120_2439358835065697166.jpg","MediaType":1},{"Path":"http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731068974816-JPEG_20241108_172931_4001335386949709052.jpg","MediaType":1}]

class TrainerMediaData {
  TrainerMediaData({
    num? trainerId,
    List<TrainerMedia>? trainerMedia,
  }) {
    _trainerId = trainerId;
    _trainerMedia = trainerMedia;
  }

  TrainerMediaData.fromJson(dynamic json) {
    _trainerId = json['trainerId'];
    if (json['trainerMedia'] != null) {
      _trainerMedia = [];
      json['trainerMedia'].forEach((v) {
        _trainerMedia?.add(TrainerMedia.fromJson(v));
      });
    }
  }

  num? _trainerId;
  List<TrainerMedia>? _trainerMedia;

  num? get trainerId => _trainerId;

  List<TrainerMedia>? get trainerMedia => _trainerMedia;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trainerId'] = _trainerId;
    if (_trainerMedia != null) {
      map['trainerMedia'] = _trainerMedia?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Path : "http://88.222.215.116/uploads/babar1@yopmail.com/pictures/1731065320584-JPEG_20241108_162839_8332753072367505091.jpg"
/// MediaType : 1

class TrainerMedia {
  TrainerMedia({
    String? path,
    int? mediaType,
  }) {
    _path = path;
    _mediaType = mediaType;
  }

  TrainerMedia.fromJson(dynamic json) {
    _id = json['Id'];
    _path = json['Path'];
    _mediaType = json['MediaType'];
  }

  String? _path;
  int? _mediaType;
  int? _id;

  int? get id => _id;

  String? get path => _path;

  int? get mediaType => _mediaType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Path'] = _path;
    map['MediaType'] = _mediaType;
    return map;
  }
}
