class UserLogin {
  int code;
  String status;
  String title;
  User user;
  String message;

  UserLogin({
    required this.code,
    required this.status,
    required this.title,
    required this.user,
    required this.message,
  });

  UserLogin copyWith({
    int? code,
    String? status,
    String? title,
    User? user,
    String? message,
  }) =>
      UserLogin(
        code: code ?? this.code,
        status: status ?? this.status,
        title: title ?? this.title,
        user: user ?? this.user,
        message: message ?? this.message,
      );

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        code: json["code"],
        status: json["status"],
        title: json["title"],
        user: User.fromJson(json["user"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "title": title,
        "user": user.toJson(),
        "message": message,
      };
}

class User {
  String id;
  String firstName;
  String lastName;
  String gender;
  String email;
  String contact;
  DateTime dob;
  String address;
  String city;
  String country;
  String employeeId;
  DateTime hiringDate;
  String jobTypeId;
  String departmentId;
  String designationId;
  String password;
  String profilePicture;
  String status;
  String isOnline;
  String isOnBreak;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.contact,
    required this.dob,
    required this.address,
    required this.city,
    required this.country,
    required this.employeeId,
    required this.hiringDate,
    required this.jobTypeId,
    required this.departmentId,
    required this.designationId,
    required this.password,
    required this.profilePicture,
    required this.status,
    required this.isOnline,
    required this.isOnBreak,
  });

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? gender,
    String? email,
    String? contact,
    DateTime? dob,
    String? address,
    String? city,
    String? country,
    String? employeeId,
    DateTime? hiringDate,
    String? jobTypeId,
    String? departmentId,
    String? designationId,
    String? password,
    String? profilePicture,
    String? status,
    String? isOnline,
    String? isOnBreak,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        contact: contact ?? this.contact,
        dob: dob ?? this.dob,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        employeeId: employeeId ?? this.employeeId,
        hiringDate: hiringDate ?? this.hiringDate,
        jobTypeId: jobTypeId ?? this.jobTypeId,
        departmentId: departmentId ?? this.departmentId,
        designationId: designationId ?? this.designationId,
        password: password ?? this.password,
        profilePicture: profilePicture ?? this.profilePicture,
        status: status ?? this.status,
        isOnline: isOnline ?? this.isOnline,
        isOnBreak: isOnBreak ?? this.isOnBreak,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        email: json["email"],
        contact: json["contact"],
        dob: DateTime.parse(json["dob"]),
        address: json["address"],
        city: json["city"],
        country: json["country"],
        employeeId: json["employee_id"],
        hiringDate: DateTime.parse(json["hiring_date"]),
        jobTypeId: json["job_type_id"],
        departmentId: json["department_id"],
        designationId: json["designation_id"],
        password: json["password"],
        profilePicture: json["profile_picture"],
        status: json["status"],
        isOnline: json["is_online"],
        isOnBreak: json["is_on_break"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "email": email,
        "contact": contact,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "address": address,
        "city": city,
        "country": country,
        "employee_id": employeeId,
        "hiring_date":
            "${hiringDate.year.toString().padLeft(4, '0')}-${hiringDate.month.toString().padLeft(2, '0')}-${hiringDate.day.toString().padLeft(2, '0')}",
        "job_type_id": jobTypeId,
        "department_id": departmentId,
        "designation_id": designationId,
        "password": password,
        "profile_picture": profilePicture,
        "status": status,
        "is_online": isOnline,
        "is_on_break": isOnBreak,
      };
}
