import 'package:flutter/material.dart';

class Shape {
  Color color;
  double height;
  double width;

  // named constructor with initial data for shape class
  Shape.initial()
      : color = Colors.black,
        height = 150.0,
        width = 150.0;
}
