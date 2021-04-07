import 'package:logger/logger.dart';

class CustomFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    // TODO implement a global level warning initial value for dev and prod purposes
    return event.level != Level.verbose;
  }
}

class LoggingService extends Logger {
  Logger get logger {
    return Logger(filter: CustomFilter(), printer: PrefixPrinter(PrettyPrinter(colors: true, printEmojis: true, printTime: true)));
  }
}
