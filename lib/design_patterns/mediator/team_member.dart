import 'notification_hub.dart';

// this class is base class for class will register to mediator
base class TeamMember {
  final String name;

  TeamMember({
    required this.name,
  });

  // every team member know the mediator
  NotificationHub? notificationHub;
  String? lastNotification;

  // it can receive message from others
  void receive(String from, String message) {
    lastNotification = '$from: "$message"';
  }

  // notificationHub has list of members
  // will send to other members
  void send(String message) {
    notificationHub?.send(this, message);
  }

  // will send to one member or selected type (like developers) members
  void sendTo<T extends TeamMember>(String message) {
    notificationHub?.sendTo<T>(this, message);
  }
}
