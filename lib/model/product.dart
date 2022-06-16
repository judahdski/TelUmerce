// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.gambarProduct,
    required this.jumlahProduct,
    required this.deskripsiProduct,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
    required this.idCategory,
  });

  int id;
  String productName;
  String gambarProduct;
  String jumlahProduct;
  String deskripsiProduct;
  String harga;
  DateTime createdAt;
  DateTime updatedAt;
  int idCategory;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productName: json["product_name"],
    gambarProduct: json["gambar_product"],
    jumlahProduct: json["jumlah_product"],
    deskripsiProduct: json["deskripsi_product"],
    harga: json["harga"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    idCategory: json["id_category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "gambar_product": gambarProduct,
    "jumlah_product": jumlahProduct,
    "deskripsi_product": deskripsiProduct,
    "harga": harga,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "id_category": idCategory,
  };
}
