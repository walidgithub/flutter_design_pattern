import 'order/order.dart';

// abstract of all algorithms
abstract interface class IShippingCostsStrategy {
  late String label;
  double calculate(Order order);
}
