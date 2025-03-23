/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"Id":1,"Name":"Cycling"},{"Id":2,"Name":"Running"},{"Id":3,"Name":"Tennis"}]

class GetActivitiesResponse {
  GetActivitiesResponse({
    int? statuscode,
    String? status,
    String? message,
    List<ActivitiesData>? data,
  }) {
    _statuscode = statuscode;
    _status = status;
    _message = message;
    _data = data;
  }

  GetActivitiesResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ActivitiesData.fromJson(v));
      });
    }
  }

  int? _statuscode;
  String? _status;
  String? _message;
  List<ActivitiesData>? _data;

  GetActivitiesResponse copyWith({
    int? statuscode,
    String? status,
    String? message,
    List<ActivitiesData>? data,
  }) =>
      GetActivitiesResponse(
        statuscode: statuscode ?? _statuscode,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  List<ActivitiesData>? get data => _data;

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

/// Id : 1
/// Name : "Cycling"

class ActivitiesData {
  ActivitiesData({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  ActivitiesData.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;

  ActivitiesData copyWith({
    int? id,
    String? name,
  }) =>
      ActivitiesData(
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
