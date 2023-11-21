import '../team_member.dart';

final class Admin extends TeamMember {
  // constructor inherit name field from TeamMember class
  Admin({
    required super.name,
  });

  // return name concatenated with job name
  @override
  String toString() => '$name (Admin)';
}
