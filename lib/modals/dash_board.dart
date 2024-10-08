class DashBoardData {
  int code;
  Data data;

  DashBoardData({
    required this.code,
    required this.data,
  });

  DashBoardData copyWith({
    int? code,
    Data? data,
  }) =>
      DashBoardData(
        code: code ?? this.code,
        data: data ?? this.data,
      );

  factory DashBoardData.fromJson(Map<String, dynamic> json) => DashBoardData(
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": data.toJson(),
      };
}

class Data {
  String totalHours;
  String hoursPerDay;
  String totalHoursWorkedYesterday;
  double totalHoursInCurrentWeek;
  String totalWorkedHoursInCurrentWeek;

  Data({
    required this.totalHours,
    required this.hoursPerDay,
    required this.totalHoursWorkedYesterday,
    required this.totalHoursInCurrentWeek,
    required this.totalWorkedHoursInCurrentWeek,
  });

  Data copyWith({
    String? totalHours,
    String? hoursPerDay,
    String? totalHoursWorkedYesterday,
    double? totalHoursInCurrentWeek,
    String? totalWorkedHoursInCurrentWeek,
  }) =>
      Data(
        totalHours: totalHours ?? this.totalHours,
        hoursPerDay: hoursPerDay ?? this.hoursPerDay,
        totalHoursWorkedYesterday:
            totalHoursWorkedYesterday ?? this.totalHoursWorkedYesterday,
        totalHoursInCurrentWeek:
            totalHoursInCurrentWeek ?? this.totalHoursInCurrentWeek,
        totalWorkedHoursInCurrentWeek:
            totalWorkedHoursInCurrentWeek ?? this.totalWorkedHoursInCurrentWeek,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalHours: json["total_hours"],
        hoursPerDay: json["hours_per_day"],
        totalHoursWorkedYesterday: json["total_hours_worked_yesterday"],
        totalHoursInCurrentWeek:
            json["total_hours_in_current_week"]?.toDouble(),
        totalWorkedHoursInCurrentWeek:
            json["total_worked_hours_in_current_week"],
      );

  Map<String, dynamic> toJson() => {
        "total_hours": totalHours,
        "hours_per_day": hoursPerDay,
        "total_hours_worked_yesterday": totalHoursWorkedYesterday,
        "total_hours_in_current_week": totalHoursInCurrentWeek,
        "total_worked_hours_in_current_week": totalWorkedHoursInCurrentWeek,
      };
}

class CheckIn {
  int code;
  String status;
  String color;
  String title;
  String message;

  CheckIn({
    required this.code,
    required this.status,
    required this.color,
    required this.title,
    required this.message,
  });

  CheckIn copyWith({
    int? code,
    String? status,
    String? color,
    String? title,
    String? message,
  }) =>
      CheckIn(
        code: code ?? this.code,
        status: status ?? this.status,
        color: color ?? this.color,
        title: title ?? this.title,
        message: message ?? this.message,
      );

  factory CheckIn.fromJson(Map<String, dynamic> json) => CheckIn(
        code: json["code"],
        status: json["status"],
        color: json["color"],
        title: json["title"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "color": color,
        "title": title,
        "message": message,
      };
}
