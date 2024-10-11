import 'dart:convert';

UserCheckInRecord userCheckInRecordFromJson(String str) =>
    UserCheckInRecord.fromJson(json.decode(str));

String userCheckInRecordToJson(UserCheckInRecord data) =>
    json.encode(data.toJson());

class UserCheckInRecord {
  String status;
  String checkinAt;
  List<Break> breaks;
  String checkoutAt;

  UserCheckInRecord({
    required this.status,
    required this.checkinAt,
    required this.breaks,
    required this.checkoutAt,
  });

  UserCheckInRecord copyWith({
    String? status,
    String? checkinAt,
    List<Break>? breaks,
    String? checkoutAt,
  }) =>
      UserCheckInRecord(
        status: status ?? this.status,
        checkinAt: checkinAt ?? this.checkinAt,
        breaks: breaks ?? this.breaks,
        checkoutAt: checkoutAt ?? this.checkoutAt,
      );

  factory UserCheckInRecord.fromJson(Map<String, dynamic> json) =>
      UserCheckInRecord(
        status: json["status"],
        checkinAt: json["checkin_at"],
        breaks: List<Break>.from(json["breaks"].map((x) => Break.fromJson(x))),
        checkoutAt: json["checkout_at"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "checkin_at": checkinAt,
        "breaks": List<dynamic>.from(breaks.map((x) => x.toJson())),
        "checkout_at": checkoutAt,
      };
}

class Break {
  String type;
  String time;
  String? detail;

  Break({
    required this.type,
    required this.time,
    this.detail,
  });

  Break copyWith({
    String? type,
    String? time,
    String? detail,
  }) =>
      Break(
        type: type ?? this.type,
        time: time ?? this.time,
        detail: detail ?? this.detail,
      );

  factory Break.fromJson(Map<String, dynamic> json) => Break(
        type: json["type"],
        time: json["time"],
        detail: json["detail"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "time": time,
        "detail": detail,
      };
}
