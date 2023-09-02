// To parse this JSON data, do
//
//     final peminjamanLab = peminjamanLabFromJson(jsonString);

import 'dart:convert';

// PeminjamanLab peminjamanLabFromJson(String str) =>
//     PeminjamanLab.fromJson(json.decode(str));

String peminjamanLabToJson(PeminjamanLab data) => json.encode(data.toJson());

class PeminjamanLab {
  PeminjamanLab({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.trxDate,
    required this.name,
    required this.course,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.description,
    this.dosenName,
    this.dosenNip,
    required this.user,
    required this.item,
  });

  int id;
  int userId;
  int itemId;
  DateTime trxDate;
  String name;
  String course;
  String startTime;
  String endTime;
  String status;
  String description;
  dynamic dosenName;
  dynamic dosenNip;
  User user;
  Item item;

  factory PeminjamanLab.fromJson(Map<String, dynamic> json) => PeminjamanLab(
        id: json["id"],
        userId: json["user_id"],
        itemId: json["item_id"],
        trxDate: DateTime.parse(json["trx_date"]),
        name: json["name"] ?? "",
        course: json["course"] ?? "",
        startTime: json["start_time"],
        endTime: json["end_time"],
        status: json["status"],
        description: json["description"] ?? "",
        dosenName: json["dosen_name"] ?? "",
        dosenNip: json["dosen_nip"] ?? "",
        user: User.fromJson(json["user"]),
        item: Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "item_id": itemId,
        "trx_date":
            "${trxDate.year.toString().padLeft(4, '0')}-${trxDate.month.toString().padLeft(2, '0')}-${trxDate.day.toString().padLeft(2, '0')}",
        "name": name,
        "course": course,
        "start_time": startTime,
        "end_time": endTime,
        "status": status,
        "description": description,
        "dosen_name": dosenName,
        "dosen_nip": dosenNip,
        "user": user.toJson(),
        "item": item.toJson(),
      };
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
    required this.type,
    this.qty,
    this.location,
  });

  int id;
  String name;
  String status;
  String description;
  String type;
  dynamic qty;
  dynamic location;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        description: json["description"],
        type: json["type"],
        qty: json["qty"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "description": description,
        "type": type,
        "qty": qty,
        "location": location,
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.course,
  });

  int id;
  String name;
  String email;
  String course;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "course": course,
      };
}
