import 'package:faker/faker.dart';

import '../command.dart';
import '../shape.dart';

class ChangeWidthCommand implements Command {
  final double previousWidth;
  Shape shape;

  // constructor with initial value that has previous value from Shape constructor
  ChangeWidthCommand(this.shape) : previousWidth = shape.width;

  @override
  String getTitle() => 'Change width';

  // execute new action
  @override
  void execute() => shape.width = random.integer(150, min: 50).toDouble();

  // make undo by getting previous value
  @override
  void undo() => shape.width = previousWidth;
}
