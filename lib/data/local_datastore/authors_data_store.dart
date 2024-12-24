import 'package:objectbox/objectbox.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_author.dart';
import 'package:sarkari_yojna_flutter/data/models/author.dart';

import 'mappers/author_entity_mapper.dart';

class AuthorsLocalDataStore {
  final Box<AuthorEntity> box;

  AuthorsLocalDataStore({
    required this.box,
  });

  Future<void> insertAuthors(
    List<Author> authors,
  ) async {
    final authorEntities = authors.map((author) {
      return mapToAuthorEntity(author);
    }).toList();

    await box.putManyAsync(
      authorEntities,
    );
  }

  Future<List<Author>> getAuthors() async {
    final boxEntities =  await box.getAllAsync();

    return boxEntities.map((boxEntity){
      return mapFromAuthorEntity(boxEntity);
    }).toList();
  }


}
