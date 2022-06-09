// To parse this JSON data, do
//
//     final productsContainer = productsContainerFromJson(jsonString);

import 'dart:convert';

ProductsContainer productsContainerFromJson(String str) => ProductsContainer.fromJson(json.decode(str));

String productsContainerToJson(ProductsContainer data) => json.encode(data.toJson());

class ProductsContainer {
  ProductsContainer({
    required this.products,
  });

  List<Product> products;

  factory ProductsContainer.fromJson(Map<String, dynamic> json) => ProductsContainer(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.id,
    required this.productName,
    required this.jumlahProduct,
    required this.deskripsiProduct,
    required this.harga,
    required this.statusBarang,
    this.createdAt,
    this.updatedAt,
    required this.idCategory,
  });

  int id;
  String productName;
  String jumlahProduct;
  String deskripsiProduct;
  int harga;
  String statusBarang;
  dynamic createdAt;
  dynamic updatedAt;
  int idCategory;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    productName: json["product_name"],
    jumlahProduct: json["jumlah_product"],
    deskripsiProduct: json["deskripsi_product"],
    harga: json["harga"],
    statusBarang: json["status_barang"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    idCategory: json["id_category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "jumlah_product": jumlahProduct,
    "deskripsi_product": deskripsiProduct,
    "harga": harga,
    "status_barang": statusBarang,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "id_category": idCategory,
  };
}
