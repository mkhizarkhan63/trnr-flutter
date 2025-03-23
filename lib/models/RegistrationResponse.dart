/// statuscode : 200
/// status : "success"
/// message : "Client Created Successfully"
/// data : {"Id":49,"EmailAddress":"babar221@yopmail.com","TypeId":2,"ClientId":12,"TrainerId":null,"OTP":"172908","OTPExpires":"2024-10-31T19:02:33.000Z","IsVerified":false,"createdAt":"2024-10-31T18:57:36.000Z","updatedAt":"2024-10-31T18:57:36.000Z"}

class RegistrationResponse {
  RegistrationResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? RegistrationData.fromJson(json['data']) : null;
  }

  int? _statuscode;
  String? _status;
  String? _message;
  RegistrationData? _data;

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  RegistrationData? get data => _data;

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

/// Id : 49
/// EmailAddress : "babar221@yopmail.com"
/// TypeId : 2
/// ClientId : 12
/// TrainerId : null
/// OTP : "172908"
/// OTPExpires : "2024-10-31T19:02:33.000Z"
/// IsVerified : false
/// createdAt : "2024-10-31T18:57:36.000Z"
/// updatedAt : "2024-10-31T18:57:36.000Z"

class RegistrationData {
  RegistrationData.fromJson(dynamic json) {
    _id = json['Id'];
    _emailAddress = json['EmailAddress'];
    _typeId = json['TypeId'];
    _clientId = json['ClientId'];
    _trainerId = json['TrainerId'];
    _otp = json['OTP'];
    _oTPExpires = json['OTPExpires'];
    _isVerified = json['IsVerified'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _profileImage = json['ProfileImage'];
  }

  int? _id;
  String? _emailAddress;
  int? _typeId;
  int? _clientId;
  int? _trainerId;
  String? _otp;
  String? _oTPExpires;
  bool? _isVerified;
  String? _createdAt;
  String? _updatedAt;
  String? _firstName;
  String? _lastName;
  String? _profileImage;

  int? get id => _id;

  String? get emailAddress => _emailAddress;

  int? get typeId => _typeId;

  int? get clientId => _clientId;

  int? get trainerId => _trainerId;

  String? get otp => _otp;

  String? get oTPExpires => _oTPExpires;

  bool? get isVerified => _isVerified;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['EmailAddress'] = _emailAddress;
    map['TypeId'] = _typeId;
    map['ClientId'] = _clientId;
    map['TrainerId'] = _trainerId;
    map['OTP'] = _otp;
    map['OTPExpires'] = _oTPExpires;
    map['IsVerified'] = _isVerified;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['ProfileImage'] = _profileImage;
    return map;
  }
}
