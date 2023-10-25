import '../pizza_decorator.dart';

class Mozzarella extends PizzaDecorator {
  // this is a decorator class and ir extend abstract decorator it will add new behavior or edit old behaviors
  // it will inherit constructor that has old data form Pizza
  const Mozzarella(super.pizza);

  @override
  String getDescription() => '${pizza.getDescription()}\n- Mozzarella';

  @override
  double getPrice() => pizza.getPrice() + 0.5;
}
