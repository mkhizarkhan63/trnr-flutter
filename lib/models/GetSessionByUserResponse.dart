/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"Id":2,"title":"Advanced Yoga Class","scheduledDate":"2024-11-20","scheduledTime":"09:00 AM","activityId":2,"totalCapacity":30,"location":{"lat":40.73061,"longt":-73.935242,"locationName":"Yoga Studio NYC"},"address":"123 Yoga St, New York, NY 10001","classType":"Advanced","description":"An advanced yoga class focusing on flexibility and strength.","price":"25.00","link":"http://yogastudio.com/advanced-yoga","TypeId":2,"ClientId":11,"TrainerId":null,"createdAt":"2024-11-12T16:56:07.000Z","updatedAt":"2024-11-12T16:56:07.000Z","Activity":{"Id":2,"Name":"Running"},"SessionParticipant":[],"clientName":"syed babar","participantCount":0}]

class GetSessionByUserResponse {
  GetSessionByUserResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SessionData.fromJson(v));
      });
    }
  }

  int? _statuscode;
  String? _status;
  String? _message;
  List<SessionData>? _data;

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  List<SessionData>? get data => _data;

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

/// Id : 2
/// title : "Advanced Yoga Class"
/// scheduledDate : "2024-11-20"
/// scheduledTime : "09:00 AM"
/// activityId : 2
/// totalCapacity : 30
/// location : {"lat":40.73061,"longt":-73.935242,"locationName":"Yoga Studio NYC"}
/// address : "123 Yoga St, New York, NY 10001"
/// classType : "Advanced"
/// description : "An advanced yoga class focusing on flexibility and strength."
/// price : "25.00"
/// link : "http://yogastudio.com/advanced-yoga"
/// TypeId : 2
/// ClientId : 11
/// TrainerId : null
/// createdAt : "2024-11-12T16:56:07.000Z"
/// updatedAt : "2024-11-12T16:56:07.000Z"
/// Activity : {"Id":2,"Name":"Running"}
/// SessionParticipant : []
/// clientName : "syed babar"
/// participantCount : 0

class SessionData {
  SessionData.fromJson(dynamic json) {
    _id = json['Id'];
    _title = json['title'];
    _scheduledDate = json['scheduledDate'];
    _scheduledTime = json['scheduledTime'];
    _activityId = json['activityId'];
    _totalCapacity = json['totalCapacity'];
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _address = json['address'];
    _classType = json['classType'];
    _description = json['description'];
    _price = json['price'];
    _link = json['link'];
    _typeId = json['TypeId'];
    _clientId = json['ClientId'];
    _trainerId = json['TrainerId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _activity =
        json['Activity'] != null ? Activity.fromJson(json['Activity']) : null;
    if (json['SessionParticipant'] != null) {
      _sessionParticipant = [];
      /*json['SessionParticipant'].forEach((v) {
        _sessionParticipant?.add(Dynamic.fromJson(v));
      });*/
    }
    _clientName = json['clientName'];
    _trainerName = json['trainerName'];
    _participantCount = json['participantCount'];
  }

  int? _id;
  String? _title;
  String? _scheduledDate;
  String? _scheduledTime;
  int? _activityId;
  int? _totalCapacity;
  Location? _location;
  String? _address;
  String? _classType;
  String? _description;
  String? _price;
  String? _link;
  int? _typeId;
  int? _clientId;
  int? _trainerId;
  String? _createdAt;
  String? _updatedAt;
  Activity? _activity;
  List<dynamic>? _sessionParticipant;
  String? _clientName;
  String? _trainerName;
  int? _participantCount;

  int? get id => _id;

  String? get title => _title;

  String? get scheduledDate => _scheduledDate;

  String? get scheduledTime => _scheduledTime;

  int? get activityId => _activityId;

  int? get totalCapacity => _totalCapacity;

  Location? get location => _location;

  String? get address => _address;

  String? get classType => _classType;

  String? get description => _description;

  String? get price => _price;

  String? get link => _link;

  int? get typeId => _typeId;

  int? get clientId => _clientId;

  int? get trainerId => _trainerId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Activity? get activity => _activity;

  List<dynamic>? get sessionParticipant => _sessionParticipant;

  String? get clientName => _clientName;

  String? get trainerName => _trainerName;

  int? get participantCount => _participantCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['title'] = _title;
    map['scheduledDate'] = _scheduledDate;
    map['scheduledTime'] = _scheduledTime;
    map['activityId'] = _activityId;
    map['totalCapacity'] = _totalCapacity;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    map['address'] = _address;
    map['classType'] = _classType;
    map['description'] = _description;
    map['price'] = _price;
    map['link'] = _link;
    map['TypeId'] = _typeId;
    map['ClientId'] = _clientId;
    map['TrainerId'] = _trainerId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_activity != null) {
      map['Activity'] = _activity?.toJson();
    }
    if (_sessionParticipant != null) {
      map['SessionParticipant'] =
          _sessionParticipant?.map((v) => v.toJson()).toList();
    }
    map['clientName'] = _clientName;
    map['trainerName'] = _trainerName;
    map['participantCount'] = _participantCount;
    return map;
  }
}

/// Id : 2
/// Name : "Running"

class Activity {
  Activity.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    return map;
  }
}

/// lat : 40.73061
/// longt : -73.935242
/// locationName : "Yoga Studio NYC"

class Location {
  Location({
    double? lat,
    double? longt,
    String? locationName,
  }) {
    _lat = lat;
    _longt = longt;
    _locationName = locationName;
  }

  Location.fromJson(dynamic json) {
    _lat = json['lat'];
    _longt = json['longt'];
    _locationName = json['locationName'];
  }

  double? _lat;
  double? _longt;
  String? _locationName;

  double? get lat => _lat;

  double? get longt => _longt;

  String? get locationName => _locationName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['longt'] = _longt;
    map['locationName'] = _locationName;
    return map;
  }
}
