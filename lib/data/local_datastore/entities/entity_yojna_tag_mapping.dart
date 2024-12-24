

// @Entity()
// class YojnaTagMapEntity {
//
//   @Id(assignable: true)
//   final String id;
//   final String title;
//   final String content;
//   final Uri? art;
//   @Backlink('tags')
//   final List<Tag> tags = ToMany<Tag>();
//   @Backlink('authors')
//   final List<Author> authors = ToMany<Author>();
//
//   const YojnaTagMapEntity({
//     required this.id,
//     required this.name,
//     required this.type,
//     required this.lowerLimit,
//     required this.upperLimit,
//     required this.values,
//   });
// }
