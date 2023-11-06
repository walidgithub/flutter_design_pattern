import 'package:faker/faker.dart';

import '../command.dart';
import '../shape.dart';

class ChangeHeightCommand implements Command {
  final double previousHeight;
  Shape shape;

  // constructor with initial value that has previous value from Shape constructor
  ChangeHeightCommand(this.shape) : previousHeight = shape.height;

  @override
  String getTitle() => 'Change height';

  // execute new action
  @override
  void execute() => shape.height = random.integer(150, min: 50).toDouble();

  // make undo by getting previous value
  @override
  void undo() => shape.height = previousHeight;
}
