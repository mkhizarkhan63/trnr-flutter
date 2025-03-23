/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"TrainerId":30,"Ratings":5,"Reviews":"good trainer","Client":{"Id":11,"FirstName":"syed","LastName":"babar"},"CreatedAt":"2024-11-10T18:19:01.000Z"}]

class GetTrainerReviewResponse {
  GetTrainerReviewResponse({
      int? statuscode,
      String? status, 
      String? message, 
      List<TrainerReviewData>? data,}){
    _statuscode = statuscode;
    _status = status;
    _message = message;
    _data = data;
}

  GetTrainerReviewResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(TrainerReviewData.fromJson(v));
      });
    }
  }
  int? _statuscode;
  String? _status;
  String? _message;
  List<TrainerReviewData>? _data;
GetTrainerReviewResponse copyWith({  int? statuscode,
  String? status,
  String? message,
  List<TrainerReviewData>? data,
}) => GetTrainerReviewResponse(  statuscode: statuscode ?? _statuscode,
  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  int? get statuscode => _statuscode;
  String? get status => _status;
  String? get message => _message;
  List<TrainerReviewData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = _statuscode;
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// TrainerId : 30
/// Ratings : 5
/// Reviews : "good trainer"
/// Client : {"Id":11,"FirstName":"syed","LastName":"babar"}
/// CreatedAt : "2024-11-10T18:19:01.000Z"

class TrainerReviewData {
  TrainerReviewData({
      int? trainerId,
      int? ratings,
      String? reviews, 
      Client? client, 
      String? createdAt,}){
    _trainerId = trainerId;
    _ratings = ratings;
    _reviews = reviews;
    _client = client;
    _createdAt = createdAt;
}

  TrainerReviewData.fromJson(dynamic json) {
    _trainerId = json['TrainerId'];
    _ratings = json['Ratings'];
    _reviews = json['Reviews'];
    _client = json['Client'] != null ? Client.fromJson(json['Client']) : null;
    _createdAt = json['CreatedAt'];
  }
  int? _trainerId;
  int? _ratings;
  String? _reviews;
  Client? _client;
  String? _createdAt;
TrainerReviewData copyWith({  int? trainerId,
  int? ratings,
  String? reviews,
  Client? client,
  String? createdAt,
}) => TrainerReviewData(  trainerId: trainerId ?? _trainerId,
  ratings: ratings ?? _ratings,
  reviews: reviews ?? _reviews,
  client: client ?? _client,
  createdAt: createdAt ?? _createdAt,
);
  int? get trainerId => _trainerId;
  int? get ratings => _ratings;
  String? get reviews => _reviews;
  Client? get client => _client;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TrainerId'] = _trainerId;
    map['Ratings'] = _ratings;
    map['Reviews'] = _reviews;
    if (_client != null) {
      map['Client'] = _client?.toJson();
    }
    map['CreatedAt'] = _createdAt;
    return map;
  }

}

/// Id : 11
/// FirstName : "syed"
/// LastName : "babar"

class Client {
  Client({
      int? id,
      String? firstName, 
      String? lastName,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
}

  Client.fromJson(dynamic json) {
    _id = json['Id'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
Client copyWith({  int? id,
  String? firstName,
  String? lastName,
}) => Client(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
);
  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    return map;
  }

}