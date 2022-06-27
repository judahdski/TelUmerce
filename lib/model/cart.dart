// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

import 'package:telumerce/model/product.dart';
import 'package:telumerce/model/user.dart';

String cartToJson(Cart data) => json.encode(data.toJson());

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
  StatusCart status;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idUser: json["id_user"],
    idStatusCart: json["id_status_cart"],
    cartItem: List<CartItem>.from(json["cart_item"].map((x) => CartItem.fromJson(x))),
    user: User.fromJson(json["user"]),
    status: StatusCart.fromJson(json["status"]),
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
