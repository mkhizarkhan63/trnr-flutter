/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"Id":1,"Gender":"Male"},{"Id":2,"Gender":"Female"}]

class GetGenderResponse {
  GetGenderResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(GenderData.fromJson(v));
      });
    }
  }

  int? _statuscode;
  String? _status;
  String? _message;
  List<GenderData>? _data;

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  List<GenderData>? get data => _data;

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
/// Gender : "Male"

class GenderData {
  GenderData.fromJson(dynamic json) {
    _id = json['Id'];
    _gender = json['Gender'];
  }

  int? _id;
  String? _gender;

  int? get id => _id;

  String? get gender => _gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Gender'] = _gender;
    return map;
  }
}
