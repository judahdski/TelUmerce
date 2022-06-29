class Metodepembayaran {
  Metodepembayaran({
    required this.id,
    required this.metode,
    required this.noRek,
    required this.createdAt,
    required this.updatedAt,
    required this.idStatusMetode,
  });

  int id;
  String metode;
  String noRek;
  DateTime createdAt;
  DateTime updatedAt;
  int idStatusMetode;

  factory Metodepembayaran.fromJson(Map<String, dynamic> json) =>
      Metodepembayaran(
        id: json["id"],
        metode: json["metode"],
        noRek: json["no_rek"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idStatusMetode: json["id_status_metode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "metode": metode,
        "no_rek": noRek,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id_status_metode": idStatusMetode,
      };
}
