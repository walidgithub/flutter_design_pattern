import 'order_item.dart';

class Order {
  final List<OrderItem> items = [];

  // fold mean you will loop for (items) and start with 0.0 then update this value by sum old and new value
  double get price =>
      items.fold(0.0, (sum, orderItem) => sum + orderItem.price);

  void addOrderItem(OrderItem orderItem) => items.add(orderItem);
}
