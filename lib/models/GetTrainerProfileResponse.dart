import 'package:trainr/models/GetGenderResponse.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/models/PersonalTrainingServiceResponse.dart';
import 'package:trainr/models/SpecializationResponseModel.dart';

import 'GetAllSessionResponse.dart';

/// statuscode : 200
/// status : "success"
/// message : "message"
/// data : {"Id":36,"EmailAddress":"babar26@yopmail.com","FirstName":"babar","LastName":"khurshid","DoB":"14-11-94","CountryResidence":"karachi","Gender":"Male","MobileNumber":"03116717286","Nationality":"Pakistani","Description":null,"TypeId":1,"NationalCertificate":{"Id":45,"Name":"http://88.222.215.116/uploads/babar26@yopmail.com/nationalCertificate/1731608017297-IMG-20241114-WA0003.jpg"},"PersonalTrainingservices":[{"Id":1,"Name":"Online Training"},{"Id":2,"Name":"In-Home Training"}],"Specializations":[{"Id":1,"Name":"BodyBuilding"},{"Id":2,"Name":"Crossfit"},{"Id":7,"Name":"Calisthenics"}],"Languages":[{"Id":1,"Name":"English"},{"Id":2,"Name":"Urdu"}],"Certificates":[{"Id":43,"Name":"http://88.222.215.116/uploads/babar26@yopmail.com/certificates/1731608017296-IMG-20241114-WA0006.jpg"}],"SocialLinks":[]}

class GetTrainerProfileResponse {
  GetTrainerProfileResponse({
    num? statuscode,
    String? status,
    String? message,
    TrainerProfileData? data,
  }) {
    _statuscode = statuscode;
    _status = status;
    _message = message;
    _data = data;
  }

  GetTrainerProfileResponse.fromJson(dynamic json) {
    _statuscode = json['statuscode'];
    _status = json['status'];
    _message = json['message'];
    _data =
        json['data'] != null ? TrainerProfileData.fromJson(json['data']) : null;
  }

  num? _statuscode;
  String? _status;
  String? _message;
  TrainerProfileData? _data;

  GetTrainerProfileResponse copyWith({
    num? statuscode,
    String? status,
    String? message,
    TrainerProfileData? data,
  }) =>
      GetTrainerProfileResponse(
        statuscode: statuscode ?? _statuscode,
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  num? get statuscode => _statuscode;

  String? get status => _status;

  String? get message => _message;

  TrainerProfileData? get data => _data;

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

/// Id : 36
/// EmailAddress : "babar26@yopmail.com"
/// FirstName : "babar"
/// LastName : "khurshid"
/// DoB : "14-11-94"
/// CountryResidence : "karachi"
/// Gender : "Male"
/// MobileNumber : "03116717286"
/// Nationality : "Pakistani"
/// Description : null
/// TypeId : 1
/// NationalCertificate : {"Id":45,"Name":"http://88.222.215.116/uploads/babar26@yopmail.com/nationalCertificate/1731608017297-IMG-20241114-WA0003.jpg"}
/// PersonalTrainingservices : [{"Id":1,"Name":"Online Training"},{"Id":2,"Name":"In-Home Training"}]
/// Specializations : [{"Id":1,"Name":"BodyBuilding"},{"Id":2,"Name":"Crossfit"},{"Id":7,"Name":"Calisthenics"}]
/// Languages : [{"Id":1,"Name":"English"},{"Id":2,"Name":"Urdu"}]
/// Certificates : [{"Id":43,"Name":"http://88.222.215.116/uploads/babar26@yopmail.com/certificates/1731608017296-IMG-20241114-WA0006.jpg"}]
/// SocialLinks : []

class TrainerProfileData {
  TrainerProfileData({
    int? id,
    String? emailAddress,
    String? firstName,
    String? lastName,
    String? doB,
    String? countryResidence,
    GenderData? gender,
    String? mobileNumber,
    String? nationality,
    String? profileImage,
    dynamic description,
    int? typeId,
    NationalCertificate? nationalCertificate,
    List<PersonalTrainingData>? personalTrainingservices,
    List<SpecializationData>? specializations,
    List<LanguageData>? languages,
    List<Certificates>? certificates,
    List<dynamic>? socialLinks,
  }) {
    _id = id;
    _emailAddress = emailAddress;
    _firstName = firstName;
    _lastName = lastName;
    _doB = doB;
    _countryResidence = countryResidence;
    _gender = gender;
    _mobileNumber = mobileNumber;
    _profileImage = profileImage;
    _nationality = nationality;
    _description = description;
    _typeId = typeId;
    _nationalCertificate = nationalCertificate;
    _personalTrainingservices = personalTrainingservices;
    _specializations = specializations;
    _languages = languages;
    _certificates = certificates;
    _socialLinks = socialLinks;
  }

  TrainerProfileData.fromJson(dynamic json) {
    _id = json['Id'];
    _emailAddress = json['EmailAddress'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _doB = json['DoB'];
    _countryResidence = json['CountryResidence'];
    _profileImage = json["ProfileImage"];
    _mobileNumber = json['MobileNumber'];
    _nationality = json['Nationality'];
    _description = json['Description'];
    _typeId = json['TypeId'];

    _gender =
        json['Gender'] != null ? GenderData.fromJson(json["Gender"]) : null;
    _location =
        json['Location'] != null ? LocationData.fromJson(json['Location']) : null;
    _nationalCertificate = json['NationalCertificate'] != null
        ? NationalCertificate.fromJson(json['NationalCertificate'])
        : null;
    if (json['PersonalTrainingservices'] != null) {
      _personalTrainingservices = [];
      json['PersonalTrainingservices'].forEach((v) {
        _personalTrainingservices?.add(PersonalTrainingData.fromJson(v));
      });
    }
    if (json['Specializations'] != null) {
      _specializations = [];
      json['Specializations'].forEach((v) {
        _specializations?.add(SpecializationData.fromJson(v));
      });
    }
    if (json['Languages'] != null) {
      _languages = [];
      json['Languages'].forEach((v) {
        _languages?.add(LanguageData.fromJson(v));
      });
    }
    if (json['Certificates'] != null) {
      _certificates = [];
      json['Certificates'].forEach((v) {
        _certificates?.add(Certificates.fromJson(v));
      });
    }
    if (json['SocialLinks'] != null) {
      _socialLinks = [];
      json['SocialLinks'].forEach((v) {
        _socialLinks?.add(v);
      });
    }
  }

  int? _id;
  String? _emailAddress;
  String? _firstName;
  String? _lastName;
  String? _doB;
  String? _countryResidence;
  String? _profileImage;
  GenderData? _gender;
  String? _mobileNumber;
  LocationData? _location;
  String? _nationality;
  dynamic _description;
  int? _typeId;
  NationalCertificate? _nationalCertificate;
  List<PersonalTrainingData>? _personalTrainingservices;
  List<SpecializationData>? _specializations;
  List<LanguageData>? _languages;
  List<Certificates>? _certificates;
  List<dynamic>? _socialLinks;

  TrainerProfileData copyWith({
    int? id,
    String? emailAddress,
    String? firstName,
    String? lastName,
    String? doB,
    String? countryResidence,
    GenderData? gender,
    String? mobileNumber,
    String? profileImage,
    String? nationality,
    dynamic description,
    int? typeId,
    NationalCertificate? nationalCertificate,
    List<PersonalTrainingData>? personalTrainingservices,
    List<SpecializationData>? specializations,
    List<LanguageData>? languages,
    List<Certificates>? certificates,
    List<dynamic>? socialLinks,
  }) =>
      TrainerProfileData(
        id: id ?? _id,
        emailAddress: emailAddress ?? _emailAddress,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        doB: doB ?? _doB,
        countryResidence: countryResidence ?? _countryResidence,
        gender: gender ?? _gender,
        mobileNumber: mobileNumber ?? _mobileNumber,
        nationality: nationality ?? _nationality,
        description: description ?? _description,
        profileImage: profileImage ?? _profileImage,
        typeId: typeId ?? _typeId,
        nationalCertificate: nationalCertificate ?? _nationalCertificate,
        personalTrainingservices:
            personalTrainingservices ?? _personalTrainingservices,
        specializations: specializations ?? _specializations,
        languages: languages ?? _languages,
        certificates: certificates ?? _certificates,
        socialLinks: socialLinks ?? _socialLinks,
      );

  int? get id => _id;

  String? get emailAddress => _emailAddress;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get doB => _doB;

  String? get countryResidence => _countryResidence;

  String? get profileImage => _profileImage;

  GenderData? get gender => _gender;

  String? get mobileNumber => _mobileNumber;

  String? get nationality => _nationality;

  dynamic get description => _description;

  LocationData? get location => _location;

  int? get typeId => _typeId;

  NationalCertificate? get nationalCertificate => _nationalCertificate;

  List<PersonalTrainingData>? get personalTrainingservices =>
      _personalTrainingservices;

  List<SpecializationData>? get specializations => _specializations;

  List<LanguageData>? get languages => _languages;

  List<Certificates>? get certificates => _certificates;

  List<dynamic>? get socialLinks => _socialLinks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['EmailAddress'] = _emailAddress;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['DoB'] = _doB;
    map['CountryResidence'] = _countryResidence;
    map['ProfileImage'] = _profileImage;
    map['Gender'] = _gender;
    map['Location'] = _location;
    map['MobileNumber'] = _mobileNumber;
    map['Nationality'] = _nationality;
    map['Description'] = _description;
    map['TypeId'] = _typeId;
    if (_nationalCertificate != null) {
      map['NationalCertificate'] = _nationalCertificate?.toJson();
    }
    if (_personalTrainingservices != null) {
      map['PersonalTrainingservices'] =
          _personalTrainingservices?.map((v) => v.toJson()).toList();
    }
    if (_specializations != null) {
      map['Specializations'] =
          _specializations?.map((v) => v.toJson()).toList();
    }
    if (_languages != null) {
      map['Languages'] = _languages?.map((v) => v.toJson()).toList();
    }
    if (_certificates != null) {
      map['Certificates'] = _certificates?.map((v) => v.toJson()).toList();
    }
    if (_socialLinks != null) {
      map['SocialLinks'] = _socialLinks?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Id : 43
/// Name : "http://88.222.215.116/uploads/babar26@yopmail.com/certificates/1731608017296-IMG-20241114-WA0006.jpg"

class Certificates {
  Certificates({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  Certificates.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;

  Certificates copyWith({
    int? id,
    String? name,
  }) =>
      Certificates(
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

/// Id : 45
/// Name : "http://88.222.215.116/uploads/babar26@yopmail.com/nationalCertificate/1731608017297-IMG-20241114-WA0003.jpg"

class NationalCertificate {
  NationalCertificate({
    int? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  NationalCertificate.fromJson(dynamic json) {
    _id = json['Id'];
    _name = json['Name'];
  }

  int? _id;
  String? _name;

  NationalCertificate copyWith({
    int? id,
    String? name,
  }) =>
      NationalCertificate(
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
