/// clientId : 11
/// fullName : "syed babar"
/// profileImage : null

class ClientDetailsModel {
  ClientDetailsModel({
      int? clientId,
      String? fullName, 
      dynamic profileImage,}){
    _clientId = clientId;
    _fullName = fullName;
    _profileImage = profileImage;
}

  ClientDetailsModel.fromJson(dynamic json) {
    _clientId = json['clientId'];
    _fullName = json['fullName'];
    _profileImage = json['profileImage'];
  }
  int? _clientId;
  String? _fullName;
  dynamic _profileImage;
ClientDetailsModel copyWith({  int? clientId,
  String? fullName,
  dynamic profileImage,
}) => ClientDetailsModel(  clientId: clientId ?? _clientId,
  fullName: fullName ?? _fullName,
  profileImage: profileImage ?? _profileImage,
);
  int? get clientId => _clientId;
  String? get fullName => _fullName;
  dynamic get profileImage => _profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clientId'] = _clientId;
    map['fullName'] = _fullName;
    map['profileImage'] = _profileImage;
    return map;
  }

}