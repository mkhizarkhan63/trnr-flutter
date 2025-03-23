/// statuscode : 200
/// status : "success"
/// message : ""
/// data : [{"Id":28,"FirstName":"syed","LastName":"babar","MobileNumber":"023020","DoB":"12/11/1997","CountryResidence":"Pakistan","Nationality":"Pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-10-23T12:16:48.000Z","updatedAt":"2024-10-23T12:16:48.000Z"},{"Id":29,"FirstName":"rumaisa","LastName":"khan","MobileNumber":"023020","DoB":"12/11/1997","CountryResidence":"Pakistan","Nationality":"Pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-10-23T12:56:25.000Z","updatedAt":"2024-10-23T12:56:25.000Z"},{"Id":30,"FirstName":"syed","LastName":"babar","MobileNumber":"023020","DoB":"12/11/1997","CountryResidence":"Pakistan","Nationality":"Pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-10-27T19:55:04.000Z","updatedAt":"2024-11-13T19:18:45.000Z"},{"Id":31,"FirstName":"syed","LastName":"babar","MobileNumber":"03116717286","DoB":"14/12/1997","CountryResidence":"Pakistan","Nationality":"Pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-10-31T19:53:35.000Z","updatedAt":"2024-10-31T19:53:35.000Z"},{"Id":32,"FirstName":"syed","LastName":"babar","MobileNumber":"03116717286","DoB":"14/12/1997","CountryResidence":"Pakistan","Nationality":"Pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-11-01T11:36:49.000Z","updatedAt":"2024-11-01T11:36:49.000Z"},{"Id":33,"FirstName":"khizar","LastName":"khan","MobileNumber":"23232","DoB":"12/11/1997","CountryResidence":"pakistan","Nationality":"pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-11-07T18:05:37.000Z","updatedAt":"2024-11-07T18:05:37.000Z"},{"Id":34,"FirstName":"basit","LastName":"syed","MobileNumber":"2737373737","DoB":"07-11-24","CountryResidence":"Karachi","Nationality":"Pakistani","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":null,"createdAt":"2024-11-07T18:09:39.000Z","updatedAt":"2024-11-07T18:09:43.000Z"},{"Id":35,"FirstName":"Rashid","LastName":"Zainal","MobileNumber":"0526323335","DoB":"06-08-99","CountryResidence":"UAE","Nationality":"UAE","Description":null,"GenderId":1,"location":null,"TypeId":1,"NationalCertificateId":44,"createdAt":"2024-11-10T12:39:13.000Z","updatedAt":"2024-11-10T12:39:18.000Z"},{"Id":36,"FirstName":"babar","LastName":"khurshid","MobileNumber":"03116717286","DoB":"14-11-94","CountryResidence":"karachi","Nationality":"Pakistani","Description":null,"GenderId":1,"location":{"lat":24.902991134423495,"longt":67.18606118112803,"locationName":"W53P+6C5,Karachi,Sindh, Pakistan"},"TypeId":1,"NationalCertificateId":45,"createdAt":"2024-11-14T18:13:30.000Z","updatedAt":"2024-11-14T18:13:37.000Z"}]

class GetAllTrainersResponse {
  GetAllTrainersResponse({
    num? statuscode,
    String? status,
    String? message,
    List<AllTrainerData>? data,
  }) {
    _statuscode = statuscode;
    _status = status;
    _message = message;
    _data = data;
  }

  GetAllTrainersResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(AllTrainerData.fromJson(v));
      });
    }
  }

  num? _statuscode;
  String? _status;
  String? _message;
  List<AllTrainerData>? _data;

  GetAllTrainersResponse copyWith({
    num? statuscode,
    String? status,
    String? message,
    List<AllTrainerData>? data,
  }) =>
      GetAllTrainersResponse(
        statuscode: statuscode ?? _statuscode,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  List<AllTrainerData>? get data => _data;

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

/// Id : 28
/// FirstName : "syed"
/// LastName : "babar"
/// MobileNumber : "023020"
/// DoB : "12/11/1997"
/// CountryResidence : "Pakistan"
/// Nationality : "Pakistani"
/// Description : null
/// GenderId : 1
/// location : null
/// TypeId : 1
/// NationalCertificateId : null
/// createdAt : "2024-10-23T12:16:48.000Z"
/// updatedAt : "2024-10-23T12:16:48.000Z"

class AllTrainerData {
  AllTrainerData({
    int? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? doB,
    String? countryResidence,
    String? nationality,
    dynamic description,
    int? genderId,
    dynamic location,
    int? typeId,
    dynamic nationalCertificateId,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _mobileNumber = mobileNumber;
    _doB = doB;
    _countryResidence = countryResidence;
    _nationality = nationality;
    _description = description;
    _genderId = genderId;
    _location = location;
    _typeId = typeId;
    _nationalCertificateId = nationalCertificateId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  AllTrainerData.fromJson(dynamic json) {
    _id = json['Id'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _mobileNumber = json['MobileNumber'];
    _doB = json['DoB'];
    _countryResidence = json['CountryResidence'];
    _nationality = json['Nationality'];
    _description = json['Description'];
    _genderId = json['GenderId'];
    _location = json['location'];
    _typeId = json['TypeId'];
    _nationalCertificateId = json['NationalCertificateId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  int? _id;
  String? _firstName;
  String? _lastName;
  String? _mobileNumber;
  String? _doB;
  String? _countryResidence;
  String? _nationality;
  dynamic _description;
  int? _genderId;
  dynamic _location;
  int? _typeId;
  dynamic _nationalCertificateId;
  String? _createdAt;
  String? _updatedAt;

  AllTrainerData copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    String? doB,
    String? countryResidence,
    String? nationality,
    dynamic description,
    int? genderId,
    dynamic location,
    int? typeId,
    dynamic nationalCertificateId,
    String? createdAt,
    String? updatedAt,
  }) =>
      AllTrainerData(
        id: id ?? _id,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        mobileNumber: mobileNumber ?? _mobileNumber,
        doB: doB ?? _doB,
        countryResidence: countryResidence ?? _countryResidence,
        nationality: nationality ?? _nationality,
        description: description ?? _description,
        genderId: genderId ?? _genderId,
        location: location ?? _location,
        typeId: typeId ?? _typeId,
        nationalCertificateId: nationalCertificateId ?? _nationalCertificateId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  int? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get mobileNumber => _mobileNumber;

  String? get doB => _doB;

  String? get countryResidence => _countryResidence;

  String? get nationality => _nationality;

  dynamic get description => _description;

  int? get genderId => _genderId;

  dynamic get location => _location;

  int? get typeId => _typeId;

  dynamic get nationalCertificateId => _nationalCertificateId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['MobileNumber'] = _mobileNumber;
    map['DoB'] = _doB;
    map['CountryResidence'] = _countryResidence;
    map['Nationality'] = _nationality;
    map['Description'] = _description;
    map['GenderId'] = _genderId;
    map['location'] = _location;
    map['TypeId'] = _typeId;
    map['NationalCertificateId'] = _nationalCertificateId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
