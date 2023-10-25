import 'package:flutter/material.dart';

import 'ipositioned_shape.dart';
import 'shape_type.dart';
import 'shapes/index.dart';

// here we call shape and set static and dynamic values
class ShapeFactory {
  const ShapeFactory();

  // return Circle or Square with its static and dynamic values
  IPositionedShape createShape(ShapeType shapeType) => switch (shapeType) {
        ShapeType.circle => Circle(
            color: Colors.red.withOpacity(0.2),
            diameter: 10.0,
          ),
        ShapeType.square => Square(
            color: Colors.blue.withOpacity(0.2),
            width: 10.0,
          ),
      };
}
