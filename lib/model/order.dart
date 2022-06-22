// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:telumerce/model/cart.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order({
    required this.id,
    required this.noResi,
    required this.jumlahHarga,
    required this.alamat,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
    required this.statusOrderId,
    required this.pembayaranId,
    required this.idCart,
    required this.idOpsikirim,
    required this.idMetodePembayaran,
    required this.statusOrder,
    required this.cart,
    required this.opsikirim,
    required this.metodepembayaran,
    required this.pembayaran,
  });

  int id;
  String noResi;
  String jumlahHarga;
  String alamat;
  DateTime orderDate;
  DateTime createdAt;
  DateTime updatedAt;
  int statusOrderId;
  int pembayaranId;
  int idCart;
  int idOpsikirim;
  int idMetodePembayaran;
  Opsikirim statusOrder;
  Cart cart;
  Opsikirim opsikirim;
  Metodepembayaran metodepembayaran;
  Pembayaran pembayaran;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        noResi: json["no_resi"],
        jumlahHarga: json["jumlah_harga"],
        alamat: json["alamat"],
        orderDate: DateTime.parse(json["order_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        statusOrderId: json["status_order_id"],
        pembayaranId: json["pembayaran_id"],
        idCart: json["id_cart"],
        idOpsikirim: json["id_opsikirim"],
        idMetodePembayaran: json["id_metode_pembayaran"],
        statusOrder: Opsikirim.fromJson(json["status_order"]),
        cart: Cart.fromJson(json["cart"]),
        opsikirim: Opsikirim.fromJson(json["opsikirim"]),
        metodepembayaran: Metodepembayaran.fromJson(json["metodepembayaran"]),
        pembayaran: Pembayaran.fromJson(json["pembayaran"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no_resi": noResi,
        "jumlah_harga": jumlahHarga,
        "alamat": alamat,
        "order_date": orderDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status_order_id": statusOrderId,
        "pembayaran_id": pembayaranId,
        "id_cart": idCart,
        "id_opsikirim": idOpsikirim,
        "id_metode_pembayaran": idMetodePembayaran,
        "status_order": statusOrder.toJson(),
        "cart": cart.toJson(),
        "opsikirim": opsikirim.toJson(),
        "metodepembayaran": metodepembayaran.toJson(),
        "pembayaran": pembayaran.toJson(),
      };
}

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
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        opsi: json["opsi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "opsi": opsi,
      };
}

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
