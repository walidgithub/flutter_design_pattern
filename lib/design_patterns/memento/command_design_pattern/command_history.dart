import 'dart:collection';

import 'icommand.dart';

// this place which will save all states of shape
class CommandHistory {
  // listQueue let us use addFirst(), addLast(), removeLast() and removeFirst() methods in addition to other list methods like add
  final _commandList = ListQueue<ICommand>();

  bool get isEmpty => _commandList.isEmpty;

  void add(ICommand command) => _commandList.add(command);

  void undo() {
    if (_commandList.isEmpty) return;
    _commandList.removeLast().undo();
  }
}
