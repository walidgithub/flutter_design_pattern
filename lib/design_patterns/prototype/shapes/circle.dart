import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../shape.dart';

// this is a concrete prototype class
class Circle extends Shape {
  double radius;

  // here it is a constructor with variable radius and inherited variable color
  Circle(super.color, this.radius);

  // here it is a named constructor with default value for variable radius
  // and with default value for inherited variable color
  Circle.initial([super.color = Colors.black]) : radius = 50.0;

  // this named constructor inherit superclass named constructor by using super.clone
  // here it is a named constructor with default value for variable radius from source
  // so it will have color from superclass (it was a default value too) and radius from as default value
  // you will send original class Circle with its variables color and radius as a parameter
  Circle.clone(Circle super.source)
      : radius = source.radius,
        super.clone();

  // this function will run the named constructor (clone) and return a clone from Circle class with its current variables color and radius values
  @override
  Shape clone() => Circle.clone(this);

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
      random.integer(255),
      random.integer(255),
      random.integer(255),
      1.0,
    );
    radius = random.integer(50, min: 25).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 2 * radius,
          width: 2 * radius,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}