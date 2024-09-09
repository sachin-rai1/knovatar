import 'dart:convert';

List<ModelPosts> modelPostsFromJson(String str) => List<ModelPosts>.from(json.decode(str).map((x) => ModelPosts.fromJson(x)));

String modelPostsToJson(List<ModelPosts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelPosts {
  int userId;
  int id;
  String title;
  String body;

  ModelPosts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ModelPosts.fromJson(Map<String, dynamic> json) => ModelPosts(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
