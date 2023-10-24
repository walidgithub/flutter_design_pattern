import 'package:faker/faker.dart';

import 'entity_base.dart';

class Order extends EntityBase {
  final List<String> dishes;
  final double total;

  // constructor with default values for parameters
  Order()
      : dishes = List.generate(
          random.integer(3, min: 1),
          (_) => faker.food.dish(),
        ),
        total = random.decimal(scale: 20, min: 5);

  // named constructor with default values for parameters
  // + it inherit constructor that has id
  Order.fromJson(super.json)
      : dishes = List.from(json['dishes'] as List),
        total = json['total'] as double,
        super.fromJson();

  // function return map of id and dishes and total
  Map<String, dynamic> toJson() => {
        'id': id,
        'dishes': dishes,
        'total': total,
      };
}
