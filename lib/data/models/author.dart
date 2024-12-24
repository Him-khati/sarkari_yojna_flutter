class Author {
  final String id;
  final String name;
  final String? email;
  final Uri? picture;
  final DateTime created;
  final DateTime updated;

  const Author({
    required this.id,
    required this.name,
    required this.email,
    required this.created,
    required this.updated,
    this.picture
  });


  factory Author.fromJson(Map<String, dynamic> json) => Author(
    email: json["email"],
    name: json["name"],
    id: json["\u0024id"],
    created: DateTime.parse(json["\u0024createdAt"]),
    updated: DateTime.parse(json["\u0024updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "\u0024id": id,
  };
}
