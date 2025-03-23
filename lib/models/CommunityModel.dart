class CommunityModel {
  CommunityModel({
    required String? communityName,
    required String? coachName,
    required String? date,
    required String? time,
    required int? totalCapacity,
    required int? reservedCapacity,
    required String? location,
  }) {
    _communityName = communityName;
    _coachName = coachName;
    _date = date;
    _time = time;
    _totalCapacity = totalCapacity;
    _reservedCapacity = reservedCapacity;
    _location = location;
  }

  CommunityModel.fromJson(dynamic json) {
    _communityName = json['communityName'];
    _coachName = json['coachName'];
    _date = json['date'];
    _time = json['time'];
    _totalCapacity = json['totalCapacity'];
    _reservedCapacity = json['reservedCapacity'];
    _location = json['location'];
  }

  String? _communityName;
  String? _coachName;
  String? _date;
  String? _time;
  int? _totalCapacity;
  int? _reservedCapacity;
  String? _location;

  CommunityModel copyWith({
    String? communityName,
    String? coachName,
    String? date,
    String? time,
    int? totalCapacity,
    int? reservedCapacity,
    String? location,
  }) =>
      CommunityModel(
        communityName: communityName ?? _communityName,
        coachName: coachName ?? _coachName,
        date: date ?? _date,
        time: time ?? _time,
        totalCapacity: totalCapacity ?? _totalCapacity,
        reservedCapacity: reservedCapacity ?? _reservedCapacity,
        location: location ?? _location,
      );

  String? get communityName => _communityName;

  String? get coachName => _coachName;

  String? get date => _date;

  String? get time => _time;

  int? get totalCapacity => _totalCapacity;

  int? get reservedCapacity => _reservedCapacity;

  String? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['communityName'] = _communityName;
    map['coachName'] = _coachName;
    map['date'] = _date;
    map['time'] = _time;
    map['totalCapacity'] = _totalCapacity;
    map['reservedCapacity'] = _reservedCapacity;
    map['location'] = _location;
    return map;
  }
}
