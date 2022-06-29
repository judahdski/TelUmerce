import 'dart:convert';

import 'product.dart';
import 'user.dart';

List<Wishlist> listWishlistFromJson(List list) =>
    List<Wishlist>.from(list.map((e) => Wishlist.fromJson(e)));

Wishlist wishlistFromJson(String str) => Wishlist.fromJson(json.decode(str));

String wishlistToJson(Wishlist data) => json.encode(data.toJson());

class Wishlist {
  Wishlist({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.idProduk,
    required this.idUser,
    required this.user,
    required this.product,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int idProduk;
  int idUser;
  User user;
  Product product;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        idProduk: json["id_produk"],
        idUser: json["id_user"],
        user: User.fromJson(json["user"]),
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "id_produk": idProduk,
        "id_user": idUser,
        "user": user.toJson(),
        "product": product.toJson(),
      };
}
