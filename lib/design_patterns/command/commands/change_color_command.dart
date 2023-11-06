import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../command.dart';
import '../shape.dart';

class ChangeColorCommand implements Command {
  final Color previousColor;
  Shape shape;

  // constructor with initial value that has previous value from Shape constructor
  ChangeColorCommand(this.shape) : previousColor = shape.color;

  @override
  String getTitle() => 'Change color';

  // execute new action
  @override
  void execute() => shape.color = Color.fromRGBO(
        random.integer(255),
        random.integer(255),
        random.integer(255),
        1.0,
      );

  // make undo by getting previous value
  @override
  void undo() => shape.color = previousColor;
}
