import 'dart:convert';

import 'package:telumerce/model/user.dart';

import 'cart_item.dart';
import 'status_cart.dart';

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
        cartItem: List<CartItem>.from(
            json["cart_item"].map((x) => CartItem.fromJson(x))),
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
