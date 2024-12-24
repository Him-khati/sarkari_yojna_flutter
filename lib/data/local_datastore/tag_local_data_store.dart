import 'package:objectbox/objectbox.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_tag.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/mappers/tag_entity_mapper.dart';
import 'package:sarkari_yojna_flutter/data/models/tag.dart';

class TagLocalDataStore{

  final Box<TagEntity> box;

  TagLocalDataStore({
    required this.box,
  });

  Future<void> insertTags(
      List<Tag> tags,
      ) async {
    final authorEntities = tags.map((author) {
      return mapToTagEntity(author);
    }).toList();

    await box.putManyAsync(
      authorEntities,
    );
  }

  Future<List<Tag>> getTags() async {
    final tagEntities =  await box.getAllAsync();

    return tagEntities.map((tagEntity){
      return mapFromTagEntity(tagEntity);
    }).toList();
  }


}