// To parse this JSON data, do
//
//     final orderDetail = orderDetailFromJson(jsonString);

import 'dart:convert';

import 'package:telumerce/model/create_order.dart';
import 'package:telumerce/model/product.dart';
import 'package:telumerce/model/user.dart';

OrderDetailModel orderDetailFromJson(String str) => OrderDetailModel.fromJson(json.decode(str));

String orderDetailToJson(OrderDetailModel data) => json.encode(data.toJson());

class OrderDetailModel {
  OrderDetailModel({
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
  dynamic pembayaranId;
  int idCart;
  int idOpsikirim;
  int idMetodePembayaran;
  Opsikirim statusOrder;
  Cart cart;
  Opsikirim opsikirim;
  Metodepembayaran metodepembayaran;
  dynamic pembayaran;

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    id: json["id"],
    noResi: json["no_resi"],
    jumlahHarga: json["jumlah_harga"],
    alamat: json["alamat"],
    orderDate: DateTime.parse(json["order_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    statusOrderId: json["status_order_id"],
    pembayaranId: json["pembayaran_id"] ?? "null",
    idCart: json["id_cart"],
    idOpsikirim: json["id_opsikirim"],
    idMetodePembayaran: json["id_metode_pembayaran"],
    statusOrder: Opsikirim.fromJson(json["status_order"]),
    cart: Cart.fromJson(json["cart"]),
    opsikirim: Opsikirim.fromJson(json["opsikirim"]),
    metodepembayaran: Metodepembayaran.fromJson(json["metodepembayaran"]),
    pembayaran: "null",
    // pembayaran: Pembayaran.fromJson(json["pembayaran"]),
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

class Cart {
  Cart({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.idUser,
    required this.idStatusCart,
    required this.cartItem,
    required this.user,
    required this.status,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int idUser;
  int idStatusCart;
  List<CartItem> cartItem;
  User user;
  Opsikirim status;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idUser: json["id_user"],
    idStatusCart: json["id_status_cart"],
    cartItem: List<CartItem>.from(json["cart_item"].map((x) => CartItem.fromJson(x))),
    user: User.fromJson(json["user"]),
    status: Opsikirim.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "id_user": idUser,
    "id_status_cart": idStatusCart,
    "cart_item": List<dynamic>.from(cartItem.map((x) => x.toJson())),
    "user": user.toJson(),
    "status": status.toJson(),
  };
}

class CartItem {
  CartItem({
    required this.id,
    required this.jumlahBarang,
    required this.createdAt,
    required this.updatedAt,
    required this.idProduk,
    required this.idCart,
    required this.produk,
  });

  int id;
  int jumlahBarang;
  DateTime createdAt;
  DateTime updatedAt;
  int idProduk;
  int idCart;
  Product produk;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    jumlahBarang: json["jumlah_barang"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idProduk: json["id_produk"],
    idCart: json["id_cart"],
    produk: Product.fromJson(json["produk"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jumlah_barang": jumlahBarang,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "id_produk": idProduk,
    "id_cart": idCart,
    "produk": produk.toJson(),
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

  factory Metodepembayaran.fromJson(Map<String, dynamic> json) => Metodepembayaran(
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
