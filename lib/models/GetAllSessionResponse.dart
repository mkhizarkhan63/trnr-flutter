/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"trainer":"syed babar","client":null,"Id":1,"title":"10 days challenge","scheduledDate":"2024-11-20","scheduledTime":"2024-11-15","activityId":1,"totalCapacity":2,"location":{"lat":24.882124267373207,"longt":67.07003820687532,"locationName":"149 Bahadurabad Rd No. 11,Karachi,Sindh, Pakistan"},"address":"149 Bahadurabad Rd No. 11,Karachi,Sindh, Pakistan","classType":"Male","description":"for testing","price":"","link":"","TypeId":1,"ClientId":null,"TrainerId":30,"createdAt":"2024-11-11T19:14:56.000Z","updatedAt":"2024-11-11T19:14:56.000Z","Activity":{"Id":1,"Name":"Cycling"},"SessionParticipant":[],"participantCount":0},{"trainer":null,"client":"syed babar","Id":2,"title":"Advanced Yoga Class","scheduledDate":"2024-11-20","scheduledTime":"09:00 AM","activityId":2,"totalCapacity":30,"location":{"lat":40.73061,"longt":-73.935242,"locationName":"Yoga Studio NYC"},"address":"123 Yoga St, New York, NY 10001","classType":"Female","description":"An advanced yoga class focusing on flexibility and strength.","price":"25.00","link":"http://yogastudio.com/advanced-yoga","TypeId":2,"ClientId":11,"TrainerId":null,"createdAt":"2024-11-12T16:56:07.000Z","updatedAt":"2024-11-12T16:56:07.000Z","Activity":{"Id":2,"Name":"Running"},"SessionParticipant":[],"participantCount":0}]

class GetAllSessionResponse {
  GetAllSessionResponse({
    int? statuscode,
    String? status,
    String? message,
    List<AllSessionData>? data,
  }) {
    _statuscode = statuscode;
    _status = status;
    _message = message;
    _data = data;
  }

  GetAllSessionResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AllSessionData.fromJson(v));
      });
    }
  }

  int? _statuscode;
  String? _status;
  String? _message;
  List<AllSessionData>? _data;

  GetAllSessionResponse copyWith({
    int? statuscode,
    String? status,
    String? message,
    List<AllSessionData>? data,
  }) =>
      GetAllSessionResponse(
        statuscode: statuscode ?? _statuscode,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  List<AllSessionData>? get data => _data;

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

/// trainer : "syed babar"
/// client : null
/// Id : 1
/// title : "10 days challenge"
/// scheduledDate : "2024-11-20"
/// scheduledTime : "2024-11-15"
/// activityId : 1
/// totalCapacity : 2
/// location : {"lat":24.882124267373207,"longt":67.07003820687532,"locationName":"149 Bahadurabad Rd No. 11,Karachi,Sindh, Pakistan"}
/// address : "149 Bahadurabad Rd No. 11,Karachi,Sindh, Pakistan"
/// classType : "Male"
/// description : "for testing"
/// price : ""
/// link : ""
/// TypeId : 1
/// ClientId : null
/// TrainerId : 30
/// createdAt : "2024-11-11T19:14:56.000Z"
/// updatedAt : "2024-11-11T19:14:56.000Z"
/// Activity : {"Id":1,"Name":"Cycling"}
/// SessionParticipant : []
/// participantCount : 0

class AllSessionData {
  AllSessionData({
    String? trainer,
    dynamic client,
    int? id,
    String? title,
    String? scheduledDate,
    String? scheduledTime,
    int? activityId,
    int? totalCapacity,
    LocationData? location,
    String? address,
    String? classType,
    String? description,
    String? price,
    String? link,
    int? typeId,
    dynamic clientId,
    int? trainerId,
    String? createdAt,
    String? updatedAt,
    Activity? activity,
    List<dynamic>? sessionParticipant,
    int? participantCount,
  }) {
    _trainer = trainer;
    _client = client;
    _id = id;
    _title = title;
    _scheduledDate = scheduledDate;
    _scheduledTime = scheduledTime;
    _activityId = activityId;
    _totalCapacity = totalCapacity;
    _location = location;
    _address = address;
    _classType = classType;
    _description = description;
    _price = price;
    _link = link;
    _typeId = typeId;
    _clientId = clientId;
    _trainerId = trainerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _activity = activity;
    _sessionParticipant = sessionParticipant;
    _participantCount = participantCount;
  }

  AllSessionData.fromJson(dynamic json) {
    _trainer = json['trainer'];
    _client = json['client'];
    _id = json['Id'];
    _title = json['title'];
    _scheduledDate = json['scheduledDate'];
    _scheduledTime = json['scheduledTime'];
    _activityId = json['activityId'];
    _totalCapacity = json['totalCapacity'];
    _location =
        json['location'] != null ? LocationData.fromJson(json['location']) : null;
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
      json['SessionParticipant'].forEach((v) {
        // _sessionParticipant?.add(Dynamic.fromJson(v));
      });
    }
    _participantCount = json['participantCount'];
  }

  String? _trainer;
  dynamic _client;
  int? _id;
  String? _title;
  String? _scheduledDate;
  String? _scheduledTime;
  int? _activityId;
  int? _totalCapacity;
  LocationData? _location;
  String? _address;
  String? _classType;
  String? _description;
  String? _price;
  String? _link;
  int? _typeId;
  dynamic _clientId;
  int? _trainerId;
  String? _createdAt;
  String? _updatedAt;
  Activity? _activity;
  List<dynamic>? _sessionParticipant;
  int? _participantCount;

  AllSessionData copyWith({
    String? trainer,
    dynamic client,
    int? id,
    String? title,
    String? scheduledDate,
    String? scheduledTime,
    int? activityId,
    int? totalCapacity,
    LocationData? location,
    String? address,
    String? classType,
    String? description,
    String? price,
    String? link,
    int? typeId,
    dynamic clientId,
    int? trainerId,
    String? createdAt,
    String? updatedAt,
    Activity? activity,
    List<dynamic>? sessionParticipant,
    int? participantCount,
  }) =>
      AllSessionData(
        trainer: trainer ?? _trainer,
        client: client ?? _client,
        id: id ?? _id,
        title: title ?? _title,
        scheduledDate: scheduledDate ?? _scheduledDate,
        scheduledTime: scheduledTime ?? _scheduledTime,
        activityId: activityId ?? _activityId,
        totalCapacity: totalCapacity ?? _totalCapacity,
        location: location ?? _location,
        address: address ?? _address,
        classType: classType ?? _classType,
        description: description ?? _description,
        price: price ?? _price,
        link: link ?? _link,
        typeId: typeId ?? _typeId,
        clientId: clientId ?? _clientId,
        trainerId: trainerId ?? _trainerId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        activity: activity ?? _activity,
        sessionParticipant: sessionParticipant ?? _sessionParticipant,
        participantCount: participantCount ?? _participantCount,
      );

  String? get trainer => _trainer;

  dynamic get client => _client;

  int? get id => _id;

  String? get title => _title;

  String? get scheduledDate => _scheduledDate;

  String? get scheduledTime => _scheduledTime;

  int? get activityId => _activityId;

  int? get totalCapacity => _totalCapacity;

  LocationData? get location => _location;

  String? get address => _address;

  String? get classType => _classType;

  String? get description => _description;

  String? get price => _price;

  String? get link => _link;

  int? get typeId => _typeId;

  dynamic get clientId => _clientId;

  int? get trainerId => _trainerId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Activity? get activity => _activity;

  List<dynamic>? get sessionParticipant => _sessionParticipant;

  int? get participantCount => _participantCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trainer'] = _trainer;
    map['client'] = _client;
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
    map['participantCount'] = _participantCount;
    return map;
  }
}

/// Id : 1
/// Name : "Cycling"

class Activity {
  Activity({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Activity.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;

  Activity copyWith({
    int? id,
    String? name,
  }) =>
      Activity(
        id: id ?? _id,
        name: name ?? _name,
      );

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    return map;
  }
}

/// lat : 24.882124267373207
/// longt : 67.07003820687532
/// locationName : "149 Bahadurabad Rd No. 11,Karachi,Sindh, Pakistan"

class LocationData {
  LocationData({
    double? lat,
    double? longt,
    String? locationName,
  }) {
    _lat = lat;
    _longt = longt;
    _locationName = locationName;
  }

  LocationData.fromJson(dynamic json) {
    _lat = json['lat'];
    _longt = json['longt'];
    _locationName = json['locationName'];
  }

  double? _lat;
  double? _longt;
  String? _locationName;

  LocationData copyWith({
    double? lat,
    double? longt,
    String? locationName,
  }) =>
      LocationData(
        lat: lat ?? _lat,
        longt: longt ?? _longt,
        locationName: locationName ?? _locationName,
      );

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
