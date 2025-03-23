/// senderId : ""
/// senderProfileImage : ""
/// type : ""
/// message : ""
/// mediaUrl : ""
/// createdBy : ""

class ChatMessageModel {
  ChatMessageModel({
      String? senderId, 
      String? senderProfileImage, 
      String? type, 
      String? message, 
      String? mediaUrl, 
      String? createdBy,}){
    _senderId = senderId;
    _senderProfileImage = senderProfileImage;
    _type = type;
    _message = message;
    _mediaUrl = mediaUrl;
    _createdBy = createdBy;
}

  ChatMessageModel.fromJson(dynamic json) {
    _senderId = json['senderId'];
    _senderProfileImage = json['senderProfileImage'];
    _type = json['type'];
    _message = json['message'];
    _mediaUrl = json['mediaUrl'];
    _createdBy = json['createdBy'];
  }
  String? _senderId;
  String? _senderProfileImage;
  String? _type;
  String? _message;
  String? _mediaUrl;
  String? _createdBy;
ChatMessageModel copyWith({  String? senderId,
  String? senderProfileImage,
  String? type,
  String? message,
  String? mediaUrl,
  String? createdBy,
}) => ChatMessageModel(  senderId: senderId ?? _senderId,
  senderProfileImage: senderProfileImage ?? _senderProfileImage,
  type: type ?? _type,
  message: message ?? _message,
  mediaUrl: mediaUrl ?? _mediaUrl,
  createdBy: createdBy ?? _createdBy,
);
  String? get senderId => _senderId;
  String? get senderProfileImage => _senderProfileImage;
  String? get type => _type;
  String? get message => _message;
  String? get mediaUrl => _mediaUrl;
  String? get createdBy => _createdBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['senderId'] = _senderId;
    map['senderProfileImage'] = _senderProfileImage;
    map['type'] = _type;
    map['message'] = _message;
    map['mediaUrl'] = _mediaUrl;
    map['createdBy'] = _createdBy;
    return map;
  }

}