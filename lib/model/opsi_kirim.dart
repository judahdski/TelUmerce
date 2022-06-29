class Opsikirim {
  Opsikirim({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.opsi,
  });

  int id;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String opsi;

  factory Opsikirim.fromJson(Map<String, dynamic> json) => Opsikirim(
        id: json["id"],
        status: json["status"] ?? 'null',
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        opsi: json["opsi"] ?? 'null',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "opsi": opsi,
      };
}
