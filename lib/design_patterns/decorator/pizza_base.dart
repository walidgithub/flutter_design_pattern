import 'pizza.dart';

class PizzaBase implements Pizza {
  // default data for Pizza
  final String description;

  const PizzaBase(this.description);

  @override
  String getDescription() => description;

  @override
  double getPrice() => 3.0;
}
