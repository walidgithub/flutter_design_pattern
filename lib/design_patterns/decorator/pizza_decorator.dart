import 'pizza.dart';

abstract class PizzaDecorator implements Pizza {
  // here it a decorator abstract class that wrap the base or main abstract Pizza by add object in constructor to get old data and add new behavior
  final Pizza pizza;

  const PizzaDecorator(this.pizza);

  @override
  String getDescription() => pizza.getDescription();

  @override
  double getPrice() => pizza.getPrice();
}
