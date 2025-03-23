/// statuscode : 400
/// status : "success"
/// message : "Invalid OTP!"
/// data : true

class VerifyOtpResponse {
  VerifyOtpResponse({
      num? statuscode, 
      String? status, 
      String? message, 
      bool? data,}){
    _statuscode = statuscode;
    _status = status;
    _message = message;
    _data = data;
}

  VerifyOtpResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }
  num? _statuscode;
  String? _status;
  String? _message;
  bool? _data;
VerifyOtpResponse copyWith({  num? statuscode,
  String? status,
  String? message,
  bool? data,
}) => VerifyOtpResponse(  statuscode: statuscode ?? _statuscode,
  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get statuscode => _statuscode;
  String? get status => _status;
  String? get message => _message;
  bool? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = _statuscode;
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}