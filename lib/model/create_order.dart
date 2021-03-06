import 'dart:convert';

import 'cart.dart';
import 'metode_pembayaran.dart';
import 'opsi_kirim.dart';

CreateOrder createOrderFromJson(String str) =>
    CreateOrder.fromJson(json.decode(str));

String createOrderToJson(CreateOrder data) => json.encode(data.toJson());

class CreateOrder {
  CreateOrder({
    required this.id,
    required this.noResi,
    required this.jumlahHarga,
    required this.alamat,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
    required this.statusOrderId,
    this.pembayaranId,
    required this.idCart,
    required this.idOpsikirim,
    required this.idMetodePembayaran,
    required this.statusOrder,
    required this.cart,
    required this.opsikirim,
    required this.metodepembayaran,
  });

  int id;
  String noResi;
  String jumlahHarga;
  String alamat;
  DateTime orderDate;
  DateTime createdAt;
  DateTime updatedAt;
  int statusOrderId;
  dynamic pembayaranId;
  int idCart;
  int idOpsikirim;
  int idMetodePembayaran;
  Opsikirim statusOrder;
  Cart cart;
  Opsikirim opsikirim;
  Metodepembayaran metodepembayaran;

  factory CreateOrder.fromJson(Map<String, dynamic> json) => CreateOrder(
        id: json["id"],
        noResi: json["no_resi"],
        jumlahHarga: json["jumlah_harga"],
        alamat: json["alamat"],
        orderDate: DateTime.parse(json["order_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        statusOrderId: json["status_order_id"],
        pembayaranId: json["pembayaran_id"] ?? 'null',
        idCart: json["id_cart"],
        idOpsikirim: json["id_opsikirim"],
        idMetodePembayaran: json["id_metode_pembayaran"],
        statusOrder: Opsikirim.fromJson(json["status_order"]),
        cart: Cart.fromJson(json["cart"]),
        opsikirim: Opsikirim.fromJson(json["opsikirim"]),
        metodepembayaran: Metodepembayaran.fromJson(json["metodepembayaran"]),
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
      };
}
