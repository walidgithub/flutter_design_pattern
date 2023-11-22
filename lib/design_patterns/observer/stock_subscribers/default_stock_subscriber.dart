import '../stock.dart';
import '../stock_subscriber.dart';

// one of observers or subscribers
class DefaultStockSubscriber extends StockSubscriber {
  // constructor will define subscriber name
  DefaultStockSubscriber() {
    title = 'All stocks';
  }

  // send value to stream
  @override
  void update(Stock stock) {
    stockStreamController.add(stock);
  }
}
