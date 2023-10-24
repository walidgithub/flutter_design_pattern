import 'package:faker/faker.dart';

import 'entity_base.dart';

class Customer extends EntityBase {
  final String name;
  final String email;

  // constructor with default values for parameters
  Customer()
      : name = faker.person.name(),
        email = faker.internet.email();

  // named constructor with default values for parameters
  // + it inherit constructor that has id
  Customer.fromJson(super.json)
      : name = json['name'] as String,
        email = json['email'] as String,
        super.fromJson();

  // function return map of id and name and email
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
