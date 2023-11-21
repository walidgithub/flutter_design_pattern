import '../team_member.dart';

final class Developer extends TeamMember {
  // constructor inherit name field from TeamMember class
  Developer({
    required super.name,
  });

  // return name concatenated with job name
  @override
  String toString() => '$name (Developer)';
}
