import 'dart:async';

import '../stock_ticker.dart';
import '../stock_ticker_symbol.dart';

// one of observables
final class GoogleStockTicker extends StockTicker {
  GoogleStockTicker() {
    title = StockTickerSymbol.GOOGL.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) {
        // set value of stock
        setStock(StockTickerSymbol.GOOGL, 200000, 204000);
        // update the value for subscribers
        notifySubscribers();
      },
    );
  }
}
