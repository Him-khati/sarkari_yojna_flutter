
import 'package:objectbox/objectbox.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_author.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_tag.dart';

@Entity()
class YojnaEntity {

  @Id()
  int objectBoxId = 0;
  final String id;
  final String title;
  final String content;
  final String? art;
  @Property(type: PropertyType.date)
  final DateTime created;
  @Property(type: PropertyType.date)
  final DateTime updated;

  final tags = ToMany<TagEntity>();
  final authors = ToMany<AuthorEntity>();

  YojnaEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.updated,
    required this.created,
    this.art,
  });
}
