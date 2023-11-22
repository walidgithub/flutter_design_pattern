import '../stock.dart';
import '../stock_change_direction.dart';
import '../stock_subscriber.dart';

// one of observers or  subscribers
class GrowingStockSubscriber extends StockSubscriber {
  // constructor will define subscriber name
  GrowingStockSubscriber() {
    title = 'Growing stocks';
  }

  // send value to stream if "direction" is growing
  @override
  void update(Stock stock) {
    if (stock.changeDirection == StockChangeDirection.growing) {
      stockStreamController.add(stock);
    }
  }
}
