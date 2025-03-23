/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"Id":1,"Name":"English"},{"Id":2,"Name":"Urdu"},{"Id":3,"Name":"French"},{"Id":4,"Name":"Arabi"}]

class GetLanguagesResponse {
  GetLanguagesResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(LanguageData.fromJson(v));
      });
    }
  }

  int? _statuscode;
  String? _status;
  String? _message;
  List<LanguageData>? _data;

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  List<LanguageData>? get data => _data;

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
/// Name : "English"

class LanguageData {
  LanguageData.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;
  bool isSelected = false;

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['Name'] = _name;
    return map;
  }
}
