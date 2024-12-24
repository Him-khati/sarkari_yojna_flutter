import '../../models/tag.dart';
import '../entities/entity_tag.dart';

TagEntity mapToTagEntity(Tag tag) {
  return TagEntity(
    id: tag.id,
    name: tag.name,
    type: tag.type,
    lowerLimit: tag.lowerLimit,
    upperLimit: tag.upperLimit,
    values: tag.values,
    created: tag.created,
    updated: tag.updated,
  );
}

Tag mapFromTagEntity(TagEntity tagEntity) {
  return Tag(
    id: tagEntity.id,
    name: tagEntity.name,
    type: tagEntity.type,
    lowerLimit: tagEntity.lowerLimit,
    upperLimit: tagEntity.upperLimit,
    values: tagEntity.values,
    created: tagEntity.created,
    updated: tagEntity.updated,
  );
}