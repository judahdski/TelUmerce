class User {
  User({
    required this.id,
    required this.name,
    this.alamat,
    this.noTelp,
    required this.email,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.userTypeId,
  });

  int id;
  String name;
  dynamic alamat;
  dynamic noTelp;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int userTypeId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userTypeId: json["user_type_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alamat": alamat,
        "no_telp": noTelp,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_type_id": userTypeId,
      };
}
