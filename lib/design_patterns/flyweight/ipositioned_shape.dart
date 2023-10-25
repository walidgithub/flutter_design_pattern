import 'package:flutter/widgets.dart';

// here they are dynamic values like x and y
abstract interface class IPositionedShape {
  Widget render(double x, double y);
}
