// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> listOrderFromJson(List orderContainerList) =>
    List<Order>.from(orderContainerList
        .map((orderContainer) => Order.fromJson(orderContainer['order'])));

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
    this.pembayaranId,
    required this.idCart,
    required this.idOpsikirim,
    required this.idMetodePembayaran,
    required this.statusOrder,
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
  StatusOrder statusOrder;

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
        statusOrder: StatusOrder.fromJson(json["status_order"]),
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
      };
}

class StatusOrder {
  StatusOrder({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory StatusOrder.fromJson(Map<String, dynamic> json) => StatusOrder(
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
