class Tag {
  final String id;
  final String name;
  final String type;
  final int? lowerLimit;
  final int? upperLimit;
  final List<String> values;
  final DateTime created;
  final DateTime updated;

  const Tag({
    required this.id,
    required this.name,
    required this.type,
    required this.lowerLimit,
    required this.upperLimit,
    required this.values,
    required this.created,
    required this.updated
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    name: json["name"],
    lowerLimit: json["lower_limit"],
    upperLimit: json["upper_limit"],
    type: json["type"],
    values: List<String>.from(json["values"].map((x) => x)),
    id: json["\u0024id"],
    created: DateTime.parse(json["\u0024createdAt"]),
    updated: DateTime.parse(json["\u0024updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lower_limit": lowerLimit,
    "upper_limit": upperLimit,
    "type": type,
    "values": List<String>.from(values.map((x) => x)),
    "\u0024id": id,
    "\u0024createdAt": created.toIso8601String(),
    "\u0024updatedAt": created.toIso8601String(),
  };
}
