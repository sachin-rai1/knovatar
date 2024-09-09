import 'dart:convert';

ModelDetailPosts modelDetailPostsFromJson(String str) => ModelDetailPosts.fromJson(json.decode(str));

String modelDetailPostsToJson(ModelDetailPosts data) => json.encode(data.toJson());

class ModelDetailPosts {
  int? userId;
  int? id;
  String? title;
  String? body;

  ModelDetailPosts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory ModelDetailPosts.fromJson(Map<String, dynamic> json) => ModelDetailPosts(
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
