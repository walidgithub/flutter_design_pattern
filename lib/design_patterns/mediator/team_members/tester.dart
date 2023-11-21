import '../team_member.dart';

final class Tester extends TeamMember {
  // constructor inherit name field from TeamMember class
  Tester({
    required super.name,
  });

  // return name concatenated with job name
  @override
  String toString() => '$name (QA)';
}
