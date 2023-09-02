// To parse this JSON data, do
//
//     final peminjamanAlat = peminjamanAlatFromJson(jsonString);

import 'dart:convert';

PeminjamanAlat peminjamanAlatFromJson(String str) =>
    PeminjamanAlat.fromJson(json.decode(str));

String peminjamanAlatToJson(PeminjamanAlat data) => json.encode(data.toJson());

class PeminjamanAlat {
  PeminjamanAlat({
    required this.id,
    required this.userId,
    required this.trxDate,
    required this.status,
    required this.description,
    required this.user,
    required this.items,
  });

  int id;
  int userId;
  DateTime trxDate;
  String status;
  String description;
  User user;
  List<ItemElement> items;

  factory PeminjamanAlat.fromJson(Map<String, dynamic> json) => PeminjamanAlat(
        id: json["id"],
        userId: json["user_id"],
        trxDate: DateTime.parse(json["trx_date"]),
        status: json["status"],
        description: json["description"] ?? "",
        user: User.fromJson(json["user"]),
        items: List<ItemElement>.from(
            json["items"].map((x) => ItemElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "trx_date":
            "${trxDate.year.toString().padLeft(4, '0')}-${trxDate.month.toString().padLeft(2, '0')}-${trxDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "description": description,
        "user": user.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ItemElement {
  ItemElement({
    required this.id,
    required this.transactionsAlatId,
    required this.itemId,
    required this.description,
    required this.qty,
    required this.item,
  });

  int id;
  int transactionsAlatId;
  int itemId;
  String description;
  int qty;
  ItemItem item;

  factory ItemElement.fromJson(Map<String, dynamic> json) => ItemElement(
        id: json["id"],
        transactionsAlatId: json["transactions_alat_id"],
        itemId: json["item_id"],
        description: json["description"] ?? "",
        qty: json["qty"],
        item: ItemItem.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transactions_alat_id": transactionsAlatId,
        "item_id": itemId,
        "description": description,
        "qty": qty,
        "item": item.toJson(),
      };
}

class ItemItem {
  ItemItem({
    required this.id,
    required this.name,
    required this.status,
    required this.description,
    required this.type,
    required this.qty,
    required this.location,
  });

  int id;
  String name;
  String status;
  String description;
  String type;
  int qty;
  String location;

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
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
