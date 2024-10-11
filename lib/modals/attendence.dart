class AttendenceData {
  String status;
  List<Datum> data;
  List<dynamic> permissions;

  AttendenceData({
    required this.status,
    required this.data,
    required this.permissions,
  });

  AttendenceData copyWith({
    String? status,
    List<Datum>? data,
    List<dynamic>? permissions,
  }) =>
      AttendenceData(
        status: status ?? this.status,
        data: data ?? this.data,
        permissions: permissions ?? this.permissions,
      );

  factory AttendenceData.fromJson(Map<String, dynamic> json) => AttendenceData(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        permissions: List<dynamic>.from(json["permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
      };
}

class Datum {
  MonthHeader? monthHeader;
  int? srNo;
  String? date;
  String? checkin;
  String? checkout;
  String? datumBreak;
  String? completedHours;
  dynamic overtime;
  bool? leave;

  Datum({
    this.monthHeader,
    this.srNo,
    this.date,
    this.checkin,
    this.checkout,
    this.datumBreak,
    this.completedHours,
    this.overtime,
    this.leave,
  });

  Datum copyWith({
    MonthHeader? monthHeader,
    int? srNo,
    String? date,
    String? checkin,
    String? checkout,
    String? datumBreak,
    String? completedHours,
    dynamic overtime,
    bool? leave,
  }) =>
      Datum(
        monthHeader: monthHeader ?? this.monthHeader,
        srNo: srNo ?? this.srNo,
        date: date ?? this.date,
        checkin: checkin ?? this.checkin,
        checkout: checkout ?? this.checkout,
        datumBreak: datumBreak ?? this.datumBreak,
        completedHours: completedHours ?? this.completedHours,
        overtime: overtime ?? this.overtime,
        leave: leave ?? this.leave,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        monthHeader: json["month_header"] == null
            ? null
            : MonthHeader.fromJson(json["month_header"]),
        srNo: json["sr_no"],
        date: json["date"],
        checkin: json["checkin"],
        checkout: json["checkout"],
        datumBreak: json["break"],
        completedHours: json["completed_hours"],
        overtime: json["overtime"],
        leave: json["leave"],
      );

  Map<String, dynamic> toJson() => {
        "month_header": monthHeader?.toJson(),
        "sr_no": srNo,
        "date": date,
        "checkin": checkin,
        "checkout": checkout,
        "break": datumBreak,
        "completed_hours": completedHours,
        "overtime": overtime,
        "leave": leave,
      };
}

class MonthHeader {
  String month;
  String year;

  MonthHeader({
    required this.month,
    required this.year,
  });

  MonthHeader copyWith({
    String? month,
    String? year,
  }) =>
      MonthHeader(
        month: month ?? this.month,
        year: year ?? this.year,
      );

  factory MonthHeader.fromJson(Map<String, dynamic> json) => MonthHeader(
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "year": year,
      };
}
