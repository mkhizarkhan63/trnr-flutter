/// statuscode : 200
/// status : "success"
/// message : "Save Successfully"
/// data : ""

class CreateTrainerServicesResponse {
  CreateTrainerServicesResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }

  num? _statuscode;
  String? _status;
  String? _message;
  String? _data;

  num? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = _statuscode;
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }
}
