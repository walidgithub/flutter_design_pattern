import 'ingredient.dart';

class Burger {
  final List<Ingredient> _ingredients = [];
  late double _price;

  void addIngredient(Ingredient ingredient) => _ingredients.add(ingredient);

  String getFormattedIngredients() =>
      _ingredients.map((x) => x.getName()).join(', ');

  /*
  This operator is a replacement for add or addAll operator in dart.
  The spread operator is three dots, we can use this operator to add the list values to another list and if we want to do
  a null-aware check we can add a question mark to the expression which you want to add to our list.
   */
  String getFormattedAllergens() => <String>{
        for (final ingredient in _ingredients) ...ingredient.getAllergens(),
      }.join(', ');

  String getFormattedPrice() => '\$${_price.toStringAsFixed(2)}';

  // ignore: use_setters_to_change_properties
  void setPrice(double price) => _price = price;
}
