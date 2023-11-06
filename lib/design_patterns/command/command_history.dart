import 'dart:collection';

import 'command.dart';

class CommandHistory {
  // using list queue like stack in history because we want to remove last action to get last action
  final _commandList = ListQueue<Command>();

  // check if list is empty
  bool get isEmpty => _commandList.isEmpty;

  // get all actions in the list
  List<String> get commandHistoryList =>
      _commandList.map((c) => c.getTitle()).toList();

  // add any object extends from command
  void add(Command command) => _commandList.add(command);

  // remove last action in list
  void undo() {
    if (_commandList.isEmpty) return;

    _commandList.removeLast().undo();
  }
}
