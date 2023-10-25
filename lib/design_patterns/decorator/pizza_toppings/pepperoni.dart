import '../pizza_decorator.dart';

class Pepperoni extends PizzaDecorator {
  // this is a decorator class and ir extend abstract decorator it will add new behavior or edit old behaviors
  // it will inherit constructor that has old data form Pizza
  const Pepperoni(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()}\n- Pepperoni';

  @override
  double getPrice() => pizza.getPrice() + 1.5;
}
