import '../pizza_decorator.dart';

class Basil extends PizzaDecorator {
  // this is a decorator class and ir extend abstract decorator it will add new behavior or edit old behaviors
  // it will inherit constructor that has old data form Pizza
  const Basil(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()}\n- Basil';

  @override
  double getPrice() => pizza.getPrice() + 0.2;
}
