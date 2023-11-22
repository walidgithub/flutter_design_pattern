import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';

import 'stock.dart';

// the observer or subscriber abstract
abstract class StockSubscriber {
  // subscriber title
  late final String title;
  // subscriber id
  final id = faker.guid.guid();

  // Initializing stream controller for a broadcast stream to listen to stock
  @protected
  final StreamController<Stock> stockStreamController =
  // broadcast >> It can be listened to more than once.
      StreamController.broadcast();

  // return created stream through the controller
  Stream<Stock> get stockStream => stockStreamController.stream;

  // will add value of stock to stream
  void update(Stock stock);
}
