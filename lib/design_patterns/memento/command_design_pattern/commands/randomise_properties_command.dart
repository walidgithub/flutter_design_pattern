import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../../memento/imemento.dart';
import '../../originator.dart';
import '../icommand.dart';

// this class which client class will deal with it (it is care taker)
// it deals with originator
class RandomisePropertiesCommand implements ICommand {
  final Originator originator;
  final IMemento _backup;

  // first thing will run it will create memento (save current state)
  RandomisePropertiesCommand(this.originator)
      : _backup = originator.createMemento();

  @override
  void execute() {
    // get initial state of shape then
    final shape = originator.state;
    // change state of shape
    shape.color = Color.fromRGBO(
      random.integer(255),
      random.integer(255),
      random.integer(255),
      1.0,
    );
    shape.height = random.integer(150, min: 50).toDouble();
    shape.width = random.integer(150, min: 50).toDouble();
  }

  // restore shape state
  @override
  void undo() => originator.restore(_backup);
}
