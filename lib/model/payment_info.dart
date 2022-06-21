// To parse this JSON data, do
//
//     final paymentInfo = paymentInfoFromJson(jsonString);

import 'dart:convert';

import 'package:telumerce/model/user.dart';

PaymentInfo paymentInfoFromJson(String str) => PaymentInfo.fromJson(json.decode(str));

String paymentInfoToJson(PaymentInfo data) => json.encode(data.toJson());

class PaymentInfo {
  PaymentInfo({
    required this.opsiKirim,
    required this.user,
    required this.metodePembayaran,
  });

  List<OpsiKirim> opsiKirim;
  List<User> user;
  List<MetodePembayaran> metodePembayaran;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
    opsiKirim: List<OpsiKirim>.from(json["opsiKirim"].map((x) => OpsiKirim.fromJson(x))),
    user: List<User>.from(json["user"].map((x) => x)),
    metodePembayaran: List<MetodePembayaran>.from(json["metode_pembayaran"].map((x) => MetodePembayaran.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "opsiKirim": List<dynamic>.from(opsiKirim.map((x) => x.toJson())),
    "user": List<dynamic>.from(user.map((x) => x)),
    "metode_pembayaran": List<dynamic>.from(metodePembayaran.map((x) => x.toJson())),
  };
}

class MetodePembayaran {
  MetodePembayaran({
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

  factory MetodePembayaran.fromJson(Map<String, dynamic> json) => MetodePembayaran(
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

class OpsiKirim {
  OpsiKirim({
    required this.id,
    required this.opsi,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String opsi;
  DateTime createdAt;
  DateTime updatedAt;

  factory OpsiKirim.fromJson(Map<String, dynamic> json) => OpsiKirim(
    id: json["id"],
    opsi: json["opsi"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opsi": opsi,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
