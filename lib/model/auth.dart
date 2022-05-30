import 'dart:convert';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));

String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
  };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.userTypeId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String email;
  int userTypeId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    email: json["email"],
    userTypeId: json["user_type_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "user_type_id": userTypeId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}