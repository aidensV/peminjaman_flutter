// To parse this JSON data, do
//
//     final pengajuanForm = pengajuanFormFromJson(jsonString);

import 'dart:convert';

PengajuanForm pengajuanFormFromJson(String str) =>
    PengajuanForm.fromJson(json.decode(str));

String pengajuanFormToJson(PengajuanForm data) => json.encode(data.toJson());

class PengajuanForm {
  PengajuanForm({
    required this.id,
    required this.userId,
    required this.dateTrx,
    this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  int id;
  int userId;
  DateTime dateTrx;
  dynamic description;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  User user;

  factory PengajuanForm.fromJson(Map<String, dynamic> json) => PengajuanForm(
        id: json["id"],
        userId: json["user_id"],
        dateTrx: DateTime.parse(json["date_trx"]),
        description: json["description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date_trx":
            "${dateTrx.year.toString().padLeft(4, '0')}-${dateTrx.month.toString().padLeft(2, '0')}-${dateTrx.day.toString().padLeft(2, '0')}",
        "description": description,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.course,
  });

  int id;
  String name;
  String email;
  DateTime emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String course;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "course": course,
      };
}
