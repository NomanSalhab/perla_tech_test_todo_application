import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  int id;
  String username;
  int points;
  String phone;
  String imagePath;
  DateTime timestamp;
  String userType;

  LoginUserModel({
    required this.id,
    required this.username,
    required this.points,
    required this.phone,
    required this.imagePath,
    required this.timestamp,
    required this.userType,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        id: json["id"] ?? 0,
        username: json["username"] ?? '',
        points: json["points"] ?? 0,
        phone: json["phone"] ?? '',
        imagePath: json["image_path"] ?? '',
        timestamp:
            DateTime.parse(json["timestamp"] ?? DateTime.now().toString()),
        userType: json["user_type"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "points": points,
        "phone": phone,
        "image_path": imagePath,
        "timestamp": timestamp.toIso8601String(),
        "user_type": userType,
      };
}
