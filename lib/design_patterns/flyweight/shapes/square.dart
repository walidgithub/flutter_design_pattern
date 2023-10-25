import 'package:flutter/material.dart';

import '../ipositioned_shape.dart';

// here they are static values like shape type and color and width and height
// it will use the static values and update with dynamic values
class Square implements IPositionedShape {
  const Square({
    required this.color,
    required this.width,
  });

  final Color color;
  final double width;

  double get _height => width;

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: _height,
        width: width,
        color: color,
      ),
    );
  }
}
