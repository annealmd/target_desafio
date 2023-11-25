import 'dart:convert';


class InfoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  InfoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  InfoModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) =>
      InfoModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );

  factory InfoModel.fromJson(String str) => InfoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InfoModel.fromMap(Map<String, dynamic> json) => InfoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };

  @override
  String toString() {
    return 'InfoModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }
}
