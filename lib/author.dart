// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.actionType,
    required this.author,
    required this.message,
    required this.messageId,
    required this.messageType,
    required this.timestamp,
  });

  String actionType;
  Author author;
  String message;
  String messageId;
  String messageType;
  int timestamp;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    actionType: json["action_type"],
    author: Author.fromJson(json["author"]),
    message: json["message"],
    messageId: json["message_id"],
    messageType: json["message_type"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "action_type": actionType,
    "author": author.toJson(),
    "message": message,
    "message_id": messageId,
    "message_type": messageType,
    "timestamp": timestamp,
  };
}

class Author {
  Author({
    required this.id,
    required this.images,
    required this.name,
  });

  String id;
  List<Image> images;
  String name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    id: json["id"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "name": name,
  };
}

class Image {
  Image({
    required this.id,
    required this.url,
    required this.height,
    required this.width,
  });

  String id;
  String url;
  int height;
  int width;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    url: json["url"],
    height: json["height"] == null ? null : json["height"],
    width: json["width"] == null ? null : json["width"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "height": height == null ? null : height,
    "width": width == null ? null : width,
  };
}
