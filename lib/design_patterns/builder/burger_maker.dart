import 'burger.dart';
import 'burger_builder_base.dart';

// director class to direct us for wanted burger
class BurgerMaker {

  // we will inject this constructor later with any BurgerBuilderBase subclasses (dependency injection)
  BurgerMaker(this.burgerBuilder);

  BurgerBuilderBase burgerBuilder;

  // ignore: use_setters_to_change_properties
  void changeBurgerBuilder(BurgerBuilderBase burgerBuilder) {
    this.burgerBuilder = burgerBuilder;
  }

  // return Burger data from selected burger
  Burger getBurger() => burgerBuilder.getBurger();

  void prepareBurger() {
    // execute all burger functions from selected burger
    burgerBuilder.createBurger();
    burgerBuilder.setBurgerPrice();

    burgerBuilder.addBuns();
    burgerBuilder.addCheese();
    burgerBuilder.addPatties();
    burgerBuilder.addSauces();
    burgerBuilder.addSeasoning();
    burgerBuilder.addVegetables();
  }
}
