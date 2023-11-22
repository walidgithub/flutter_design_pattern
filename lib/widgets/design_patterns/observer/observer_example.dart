import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../constants/constants.dart';
import '../../../design_patterns/observer/observer.dart';
import 'selections/stock_subscriber_selection.dart';
import 'selections/stock_ticker_selection.dart';
import 'stock_row.dart';
import 'stock_ticker_model.dart';

class ObserverExample extends StatefulWidget {
  const ObserverExample();

  @override
  _ObserverExampleState createState() => _ObserverExampleState();
}

class _ObserverExampleState extends State<ObserverExample> {
  // list of observers
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowingStockSubscriber(),
  ];

  // list of observables
  final _stockTickers = <StockTickerModel>[
    StockTickerModel(stockTicker: GameStopStockTicker()),
    StockTickerModel(stockTicker: GoogleStockTicker()),
    StockTickerModel(stockTicker: TeslaStockTicker()),
  ];

  // list of stock data
  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;

  // start with default subscriber
  StockSubscriber _subscriber = DefaultStockSubscriber();
  var _selectedSubscriberIndex = 0;

  @override
  void initState() {
    super.initState();
    // listen for adding new values
    // return value of stream using subscriber function >> _subscriber.stockStream
    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {
    // stop ticker for all observable
    for (final ticker in _stockTickers) {
      ticker.stockTicker.stopTicker();
    }
    _stockStreamSubscription?.cancel();
    super.dispose();
  }

  // add new stock value to stream and _stockEntries
  void _onStockChange(Stock stock) => setState(() => _stockEntries.add(stock));

  void _setSelectedSubscriberIndex(int? index) {
    // toggle subscription
    for (final ticker in _stockTickers) {
      if (ticker.subscribed) {
        ticker.toggleSubscribed();
        ticker.stockTicker.unsubscribe(_subscriber);
      }
    }

    _stockStreamSubscription?.cancel();

    setState(() {
      _stockEntries.clear();
      _selectedSubscriberIndex = index!;
      _subscriber = _stockSubscriberList[_selectedSubscriberIndex];
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTickerSelection(int index) {
    final stockTickerModel = _stockTickers[index];
    final stockTicker = stockTickerModel.stockTicker;

    if (stockTickerModel.subscribed) {
      stockTicker.unsubscribe(_subscriber);
    } else {
      stockTicker.subscribe(_subscriber);
    }

    setState(() => stockTickerModel.toggleSubscribed());
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: Column(
          children: <Widget>[
            StockSubscriberSelection(
              stockSubscriberList: _stockSubscriberList,
              selectedIndex: _selectedSubscriberIndex,
              onChanged: _setSelectedSubscriberIndex,
            ),
            StockTickerSelection(
              stockTickers: _stockTickers,
              onChanged: _toggleStockTickerSelection,
            ),
            Column(
              children: [
                // return stock values reversed
                for (final stock in _stockEntries.reversed)
                  StockRow(stock: stock),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
