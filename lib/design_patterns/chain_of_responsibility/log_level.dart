enum LogLevel {
  debug,
  info,
  error;

  // index is an integer variable (property).
  /*
  In the above code, the LogLevel class has an index property.
  The lessThanOrEqual method compares the index property of the current LogLevel object with the index property of the logLevel parameter.
  If the index of the current LogLevel object is less than or equal to the index of the logLevel object, it returns true; otherwise, it returns false.
   */

  /*
  class LogLevel {
  int index;

    bool lessThanOrEqual(LogLevel logLevel) {
      return index <= logLevel.index;
    }
  }
   */

  // this is short hand for above code
  bool operator <=(LogLevel logLevel) => index <= logLevel.index;
}
