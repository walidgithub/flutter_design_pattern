import 'dart:async';
import 'dart:collection';

import 'log_message.dart';

class LogBloc {
  final List<LogMessage> _logs = [];
  final _logStream = StreamController<List<LogMessage>>();

  // use stream to send and get log message
  StreamSink<List<LogMessage>> get _inLogStream => _logStream.sink;
  Stream<List<LogMessage>> get outLogStream => _logStream.stream;

  // add message to list above
  void log(LogMessage logMessage) {
    _logs.add(logMessage);
    _inLogStream.add(UnmodifiableListView(_logs));
  }

  void dispose() {
    _logStream.close();
  }
}
