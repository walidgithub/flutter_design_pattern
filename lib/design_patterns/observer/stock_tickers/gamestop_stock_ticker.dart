import 'dart:async';

import '../stock_ticker.dart';
import '../stock_ticker_symbol.dart';

// one of observables
final class GameStopStockTicker extends StockTicker {
  GameStopStockTicker() {
    title = StockTickerSymbol.GME.name;
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        // set value of stock
        setStock(StockTickerSymbol.GME, 16000, 22000);
        // update the value for subscribers
        notifySubscribers();
      },
    );
  }
}
