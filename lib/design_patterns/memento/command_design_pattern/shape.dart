import 'package:flutter/material.dart';

class Shape {
  Color color;
  double height;
  double width;

  // named constructor with initial values for shape
  Shape.initial()
      : color = Colors.black,
        height = 150.0,
        width = 150.0;

  // named constructor to copy or get class values
  Shape.copy(Shape shape)
      : color = shape.color,
        height = shape.height,
        width = shape.width;
}
