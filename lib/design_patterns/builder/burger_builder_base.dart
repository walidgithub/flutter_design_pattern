import 'package:flutter/foundation.dart';

import 'burger.dart';

// this base class has all common builders data
abstract class BurgerBuilderBase {
  @protected
  late Burger burger;
  @protected
  late double price;

  // to take instance from object Burger
  void createBurger() => burger = Burger();

  // return Burger data
  Burger getBurger() => burger;

  // use burger function set price to set price
  void setBurgerPrice() => burger.setPrice(price);

  // not all of these ingredients are necessary
  void addBuns();
  void addCheese();
  void addPatties();
  void addSauces();
  void addSeasoning();
  void addVegetables();
}
