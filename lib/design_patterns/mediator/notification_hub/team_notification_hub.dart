import '../notification_hub.dart';
import '../team_member.dart';

// this class is the mediator that has register and send to one member or list of members functions
class TeamNotificationHub implements NotificationHub {
  // constructor has list of team members that will register
  TeamNotificationHub({
    List<TeamMember>? members,
  }) {
    members?.forEach(register);
  }

  final _teamMembers = <TeamMember>[];

  @override
  List<TeamMember> getTeamMembers() => _teamMembers;

  // register team member
  @override
  void register(TeamMember member) {
    member.notificationHub = this;
    _teamMembers.add(member);
  }

  // send message from sender to all team members
  @override
  void send(TeamMember sender, String message) {
    // get all members except sender
    final filteredMembers = _teamMembers.where((m) => m != sender);

    // let other to receive message
    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }

  // send message from sender to one of team members
  // or send to selected type (like developers) members
  @override
  void sendTo<T extends TeamMember>(TeamMember sender, String message) {
    final filteredMembers =
        _teamMembers.where((m) => m != sender).whereType<T>();

    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }
}
