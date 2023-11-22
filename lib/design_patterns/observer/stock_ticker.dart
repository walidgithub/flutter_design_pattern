import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'stock.dart';
import 'stock_change_direction.dart';
import 'stock_subscriber.dart';
import 'stock_ticker_symbol.dart';

// this is the observable class like (google or tesla ...)
// ticker mean that after specific period will notify the subscribers
base class StockTicker {
  // observable title
  late final String title;
  late final Timer stockTimer;

  @protected
  Stock? stock;

  // list of subscribers
  final _subscribers = <StockSubscriber>[];

  // add subscriber to list
  void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);

  // remove subscriber from list
  void unsubscribe(StockSubscriber subscriber) =>
      _subscribers.removeWhere((s) => s.id == subscriber.id);

  // notify subscribers by update function that send value of stock to stream
  void notifySubscribers() {
    for (final subscriber in _subscribers) {
      subscriber.update(stock!);
    }
  }

  // set stock with new values
  void setStock(StockTickerSymbol stockTickerSymbol, int min, int max) {
    // last data of stock
    final lastStock = stock;
    // random value
    final price = faker.randomGenerator.integer(max, min: min) / 100;
    // compare between values
    final changeAmount = lastStock != null ? price - lastStock.price : 0.0;

    // stock with new values
    stock = Stock(
      changeAmount: changeAmount.abs(),
      changeDirection: changeAmount > 0
          ? StockChangeDirection.growing
          : StockChangeDirection.falling,
      price: price,
      symbol: stockTickerSymbol,
    );
  }

  // cancel timer
  void stopTicker() => stockTimer.cancel();
}
