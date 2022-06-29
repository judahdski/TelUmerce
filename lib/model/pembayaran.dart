class Pembayaran {
  Pembayaran({
    required this.id,
    required this.buktiPembayaran,
    required this.pembayaranDate,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String buktiPembayaran;
  DateTime pembayaranDate;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pembayaran.fromJson(Map<String, dynamic> json) => Pembayaran(
    id: json["id"],
    buktiPembayaran: json["bukti_pembayaran"],
    pembayaranDate: DateTime.parse(json["pembayaran_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bukti_pembayaran": buktiPembayaran,
    "pembayaran_date": pembayaranDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}