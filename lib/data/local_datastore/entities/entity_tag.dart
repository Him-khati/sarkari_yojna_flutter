
import 'package:objectbox/objectbox.dart';

@Entity()
class TagEntity {

  @Id()
  int objectBoxId = 0;
  final String id;
  final String name;
  final String type;
  final int? lowerLimit;
  final int? upperLimit;
  final List<String> values;
  @Property(type: PropertyType.date)
  final DateTime created;
  @Property(type: PropertyType.date)
  final DateTime updated;

  TagEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.lowerLimit,
    required this.upperLimit,
    required this.values,
    required this.created,
    required this.updated
  });
}
