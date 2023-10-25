import 'package:flutter/material.dart';

import '../ipositioned_shape.dart';

// here they are static values like shape type and color and width and height
// it will use the static values and update with dynamic values
class Circle implements IPositionedShape {
  const Circle({
    required this.color,
    required this.diameter,
  });

  final Color color;
  final double diameter;

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
