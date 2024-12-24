
import 'package:objectbox/objectbox.dart';

@Entity()
class AuthorEntity {

  @Id()
  int objectBoxId = 0;
  final String id;
  final String name;
  final String? email;
  final String? picture;
  @Property(type: PropertyType.date)
  final DateTime created;
  @Property(type: PropertyType.date)
  final DateTime updated;

  AuthorEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.created,
    required this.updated
  });
}
