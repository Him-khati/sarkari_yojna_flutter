import '../../models/author.dart';
import '../entities/entity_author.dart';

AuthorEntity mapToAuthorEntity(Author author) {
  return AuthorEntity(
    id: author.id,
    name: author.name,
    email: author.email,
    picture: author.picture?.toString(),
    created: author.created,
    updated: author.updated,
  );
}

Author mapFromAuthorEntity(AuthorEntity author) {
  return Author(
    id: author.id,
    name: author.name,
    email: author.email,
    picture: author.picture != null ? Uri.parse(author.picture!) : null,
    created: author.created,
    updated: author.updated,
  );
}