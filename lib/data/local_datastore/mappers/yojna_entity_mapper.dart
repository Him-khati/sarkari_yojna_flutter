import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_author.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_tag.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/mappers/author_entity_mapper.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/mappers/tag_entity_mapper.dart';
import 'package:sarkari_yojna_flutter/data/models/author.dart';
import 'package:sarkari_yojna_flutter/data/models/tag.dart';

import '../../models/yojna.dart';
import '../entities/entity_yojna.dart';

YojnaEntity mapToYojnaEntity(Yojna yojna) {
  return YojnaEntity(
    id: yojna.id,
    title: yojna.title,
    content: yojna.content,
    updated: yojna.updated,
    created: yojna.created,
    art: yojna.art?.toString(),
  )
    ..authors.addAll(mapAuthorsListToEntity(yojna.authors))
    ..tags.addAll(mapTagListToEntity(yojna.tags));
}

Yojna mapFromYojnaEntity(YojnaEntity yojna) {
  return Yojna(
    id: yojna.id,
    title: yojna.title,
    content: yojna.content,
    updated: yojna.updated,
    created: yojna.created,
    art:  yojna.art != null ? Uri.parse(yojna.art!) : null,
    tags: yojna.tags.map((tagEntity) => mapFromTagEntity(tagEntity)).toList(),
    authors: yojna.authors
        .map((authorEntity) => mapFromAuthorEntity(authorEntity))
        .toList(),
  );
}

List<Yojna> mapFromYojnaEntityList(List<YojnaEntity> yojna) {
  return yojna.map((yojnaEntity) => mapFromYojnaEntity(yojnaEntity)).toList();
}

List<AuthorEntity> mapAuthorsListToEntity(List<Author> authors) {
  return authors.map((author) => mapToAuthorEntity(author)).toList();
}

List<TagEntity> mapTagListToEntity(List<Tag> tags) {
  return tags.map((tag) => mapToTagEntity(tag)).toList();
}
