import 'dart:async';

// import 'package:hybrid_logging/hybrid_logging.dart';
abstract interface class Logger {
  bool get isLoggingEnabled;

  set isLoggingEnabled(bool value);

  void info(String message);

  void severe(String message, [Object? error]);

  void warning(String message, [Object? error]);
}

abstract interface class LogController {
  Logger get logger;

  set isLoggingEnabled(bool value);
}

class DefaultLogger implements Logger {
  @override
  void info(String message) {
    _log('INFO', message);
  }

  @override
  void severe(String message, [Object? error]) {
    _log('SEVERE', message);
  }

  @override
  void warning(String message, [Object? error]) {
    _log('WARNING', message);
  }

  void _log(String level, String message) {
    if (!isLoggingEnabled) return;
    Zone.current.print('$level: $message');
  }

  @override
  bool isLoggingEnabled = true;
}

mixin LoggerController implements LogController {
  @override
  Logger get logger;

  @override
  set isLoggingEnabled(bool value) {
    logger.isLoggingEnabled = value;
  }
}

mixin TypeLogger {
  Logger get logger => DefaultLogger();
}
