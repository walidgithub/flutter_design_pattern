import 'package:faker/faker.dart';

import 'customer_details.dart';

class Customer {
  // constructor with default data id and name
  Customer()
      : id = faker.guid.guid(),
        name = faker.person.name();

  final String id;
  final String name;
  CustomerDetails? details;
}
