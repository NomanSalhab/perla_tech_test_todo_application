import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  int id;
  int userId;
  String content;
  DateTime date;

  ItemModel({
    required this.id,
    required this.userId,
    required this.content,
    required this.date,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: int.parse((json["id"] ?? '0').toString()),
        userId: int.parse((json["user_id"] ?? '0').toString()),
        content: json["content"] ?? '',
        date: DateTime.parse(json["date"] ?? DateTime.now()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "content": content,
        "date": date.toIso8601String(),
      };

  @override
  String toString() {
    return 'Item{id: $id, user_id: $userId, content: $content, date: $date}';
  }
}
