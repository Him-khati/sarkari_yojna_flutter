import 'package:sarkari_yojna_flutter/data/models/author.dart';
import 'package:sarkari_yojna_flutter/data/models/tag.dart';

class Yojna {
  final String id;
  final String title;
  final String content;
  final Uri? art;
  final DateTime created;
  final DateTime updated;
  final List<Tag> tags;
  final List<Author> authors;
  final bool active;

  const Yojna({
    required this.id,
    required this.title,
    required this.content,
    required this.tags,
    required this.authors,
    required this.created,
    required this.updated,
    this.art,
    this.active = true
  });


  factory Yojna.fromJson(Map<String, dynamic> json) => Yojna(
    title: json["title"],
    content: json["content"],
    art: json["art"],
    // active: json["active"],
    id: json["\u0024id"],
    created: DateTime.parse(json["\u0024createdAt"]),
    updated: DateTime.parse(json["\u0024updatedAt"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "art": art,
    "active": active,
    "\u0024id": id,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
  };
}
