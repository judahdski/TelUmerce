import 'dart:convert';

List<Categori> categoriesFromJson(String str) =>
    List<Categori>.from(json.decode(str).map((x) => Categori.fromJson(x)));

Categori categoriFromJson(String str) => Categori.fromJson(json.decode(str));

String categoriToJson(Categori data) => json.encode(data.toJson());

class Categori {
  Categori({
    required this.id,
    required this.nameCategory,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nameCategory;
  DateTime createdAt;
  DateTime updatedAt;

  factory Categori.fromJson(Map<String, dynamic> json) => Categori(
        id: json["id"],
        nameCategory: json["name_category"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_category": nameCategory,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
