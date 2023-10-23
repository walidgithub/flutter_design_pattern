import 'package:flutter/material.dart';

// this is the prototype class
abstract class Shape {
  Shape(this.color);

  // here it is a named constructor with default value for variable color from source
  Shape.clone(Shape source) : color = source.color;

  Color color;

  Shape clone();
  void randomiseProperties();
  Widget render();
}
