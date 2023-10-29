import 'package:flutter/foundation.dart';

import 'log_level.dart';

abstract class LoggerBase {
  @protected
  final LogLevel logLevel;
  final LoggerBase? _nextLogger;

  const LoggerBase({
    required this.logLevel,
    LoggerBase? nextLogger,
  }) : _nextLogger = nextLogger;


  // when get log level name we will compare index of level from enum
  void logMessage(LogLevel level, String message) {
    if (logLevel <= level) log(message);

    _nextLogger?.logMessage(level, message);
  }

  // call logMessage to return message
  void logDebug(String message) => logMessage(LogLevel.debug, message);
  void logInfo(String message) => logMessage(LogLevel.info, message);
  void logError(String message) => logMessage(LogLevel.error, message);

  void log(String message);
}
