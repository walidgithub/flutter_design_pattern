class PizzaToppingData {
  // name of toppings using for custom pizza beside default pizza
  PizzaToppingData(this.label);

  final String label;
  bool selected = false;

  // ignore: use_setters_to_change_properties
  void setSelected({required bool isSelected}) => selected = isSelected;
}
