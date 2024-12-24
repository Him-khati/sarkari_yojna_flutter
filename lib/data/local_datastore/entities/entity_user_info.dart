import 'package:objectbox/objectbox.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_author.dart';
import 'package:sarkari_yojna_flutter/data/local_datastore/entities/entity_tag.dart';

@Entity()
class UserInfoEntity {
  @Id()
  int objectBoxId = 0;
  final String? id;
  // Gender: Specific schemes for women, men, or other genders.
  final String? gender;
  // Location: Rural, urban, or region-specific schemes.
  final List<String>? states;
  // Income Level: Schemes targeting specific economic groups (e.g., BPL, middle-income).
  final String? incomeLevel;
  // Age Group: Eligibility or relevance based on age.
  final int? ageLowerLimit;
  final int? ageUpperLimit;
  // Caste/Community: Reservation-related or minority group schemes.
  final String? caste;
  // Disability: Accessibility-related schemes.
  final List<String>? disabilities;
  // Education Level: Schemes for students, skill training, or higher studies..
  final String? educationLevel;
  // Kids gender: Schemes like sukanya Samridhi yojna
  final List<String>? kidsGender;
  // Occupation: For farmers, self-employed, salaried workers, etc.
  final List<String>? occupation;
  //Family Status: Widow, single parent, orphans, etc.
  final String? familyStatus;
  //Family Status: married, unmarried
  final String? marriageStatus;

  @Property(type: PropertyType.date)
  final DateTime created;
  @Property(type: PropertyType.date)
  final DateTime updated;

  UserInfoEntity({
    required this.id,
    required this.gender,
    required this.states,
    required this.incomeLevel,
    required this.ageLowerLimit,
    required this.ageUpperLimit,
    required this.caste,
    required this.disabilities,
    required this.educationLevel,
    required this.kidsGender,
    required this.occupation,
    required this.familyStatus,
    required this.created,
    required this.updated,
    required this.marriageStatus
  });
}
