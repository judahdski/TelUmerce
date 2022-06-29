class StatusCart {
  StatusCart({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory StatusCart.fromJson(Map<String, dynamic> json) => StatusCart(
        id: json["id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
