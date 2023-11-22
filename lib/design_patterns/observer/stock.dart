import 'stock_change_direction.dart';
import 'stock_ticker_symbol.dart';

// this is a class of data for observables like (google or tesla ...)
class Stock {
  const Stock({
    required this.symbol,
    required this.changeDirection,
    required this.price,
    required this.changeAmount,
  });

  final StockTickerSymbol symbol;
  final StockChangeDirection changeDirection;
  final double price;
  final double changeAmount;
}
