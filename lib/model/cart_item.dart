import 'package:telumerce/model/product.dart';

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