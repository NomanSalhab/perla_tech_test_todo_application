import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String username;
  String phone;
  DateTime timestamp;

  UserModel({
    required this.id,
    required this.username,
    required this.phone,
    required this.timestamp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] ?? 0,
    username: json["username"] ?? '',
    phone: json["phone"] ?? '',
    timestamp: DateTime.tryParse(json["timestamp"] ?? '') ?? DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "phone": phone,
    "timestamp": timestamp.toIso8601String(),
  };

  @override
  String toString() => 'User{id: $id, user_name: $username, phone: $phone, timestamp: $timestamp}';
}
