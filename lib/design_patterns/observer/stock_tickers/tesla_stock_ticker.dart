import 'dart:async';

import '../stock_ticker.dart';
import '../stock_ticker_symbol.dart';

// one of observables
final class TeslaStockTicker extends StockTicker {
  TeslaStockTicker() {
    title = StockTickerSymbol.TSLA.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) {
        // set value of stock
        setStock(StockTickerSymbol.TSLA, 60000, 65000);
        // update the value for subscribers
        notifySubscribers();
      },
    );
  }
}
