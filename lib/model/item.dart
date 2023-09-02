class ItemsData {
  final int id;
  final String name;
  int qty;
  final String? status;

  ItemsData(
      {required this.id,
      required this.name,
      required this.status,
      required this.qty});

  factory ItemsData.fromJson(Map<String, dynamic> json) {
    return ItemsData(
      id: json['id'],
      name: json['name'],
      qty: json['qty'] ?? 0,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "qty": qty,
      };
}
