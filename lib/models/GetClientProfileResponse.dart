import 'GetAllSessionResponse.dart';
import 'GetGenderResponse.dart';
import 'PersonalTrainingServiceResponse.dart';
import 'SpecializationResponseModel.dart';

/// statuscode : 200
/// status : "success"
/// message : "message"
/// data : {"Id":7,"FirstName":"syed","LastName":"babar","MobileNumber":"03116717286","DoB":"14/12/1997","CountryResidence":"Pakistan","Nationality":"Pakistani","location":null,"GenderId":1,"TypeId":2,"createdAt":"2024-10-31T15:46:18.000Z","updatedAt":"2024-10-31T15:46:18.000Z","ClientId":null}

class GetClientProfileResponse {
  GetClientProfileResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? ClientData.fromJson(json['data']) : null;
  }

  int? _statuscode;
  String? _status;
  String? _message;
  ClientData? _data;

  int? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  ClientData? get data => _data;

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

/// Id : 7
/// FirstName : "syed"
/// LastName : "babar"
/// MobileNumber : "03116717286"
/// DoB : "14/12/1997"
/// CountryResidence : "Pakistan"
/// Nationality : "Pakistani"
/// location : null
/// GenderId : 1
/// TypeId : 2
/// createdAt : "2024-10-31T15:46:18.000Z"
/// updatedAt : "2024-10-31T15:46:18.000Z"
/// ClientId : null

class ClientData {
  ClientData.fromJson(dynamic json) {
    _id = json['Id'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _emailAddress = json['EmailAddress'];
    _mobileNumber = json['MobileNumber'];
    _doB = json['DoB'];
    _countryResidence = json['CountryResidence'];
    _nationality = json['Nationality'];
    _profileImage = json["ProfileImage"];
    _location =
        json['Location'] != null ? LocationData.fromJson(json['Location']) : null;
    _gender =
        json['Gender'] != null ? GenderData.fromJson(json["Gender"]) : null;
    _typeId = json['TypeId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _clientId = json['ClientId'];
    if (json['PersonalTrainingservices'] != null) {
      _personalTrainingServices = [];
      json['PersonalTrainingservices'].forEach((v) {
        _personalTrainingServices?.add(PersonalTrainingData.fromJson(v));
      });
    }
    if (json['Specializations'] != null) {
      _specializations = [];
      json['Specializations'].forEach((v) {
        _specializations?.add(SpecializationData.fromJson(v));
      });
    }
  }

  int? _id;
  String? _firstName;
  String? _lastName;
  String? _emailAddress;
  String? _mobileNumber;
  String? _doB;
  String? _profileImage;
  String? _countryResidence;
  String? _nationality;
  GenderData? _gender;
  LocationData? _location;
  int? _typeId;
  String? _createdAt;
  String? _updatedAt;
  int? _clientId;
  List<PersonalTrainingData> _personalTrainingServices = [];
  List<SpecializationData> _specializations = [];

  int? get id => _id;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get emailAddress => _emailAddress;

  String? get mobileNumber => _mobileNumber;

  String? get doB => _doB;

  String? get countryResidence => _countryResidence;

  String? get nationality => _nationality;

  String? get profileImage => _profileImage;

  LocationData? get location => _location;

  int? get typeId => _typeId;

  GenderData? get gender => _gender;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  int? get clientId => _clientId;

  List<PersonalTrainingData> get personalTrainingServices =>
      _personalTrainingServices;

  List<SpecializationData> get specializations => _specializations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['EmailAddress'] = _emailAddress;
    map['MobileNumber'] = _mobileNumber;
    map['DoB'] = _doB;
    map['Gender'] = _gender;
    map['ProfileImage'] = _profileImage;
    map['CountryResidence'] = _countryResidence;
    map['Nationality'] = _nationality;
    map['location'] = _location;
    map['TypeId'] = _typeId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['ClientId'] = _clientId;
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_personalTrainingServices != null) {
      map['PersonalTrainingservices'] =
          _personalTrainingServices?.map((v) => v.toJson()).toList();
    }
    if (_specializations != null) {
      map['Specializations'] =
          _specializations?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
