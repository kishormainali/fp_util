library logging;

import 'package:logger/logger.dart';

export 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 3,
    // number of method calls to be displayed
    errorMethodCount: 8,
    // number of method calls if stacktrace is provided
    lineLength: 140,
    // width of the output
    colors: true,
    // Colorful log messages
    printEmojis: true,

    // Print an timestamp before the message
    printTime: true, // Should each log print contain a timestamp

    // Print an emoji for each log message
    levelEmojis: {
      Level.trace: '🔍',
      Level.debug: '🐛',
      Level.info: '📣',
      Level.warning: '⚠️',
      Level.error: '🚨',
      Level.fatal: '🤷‍♂️',
    },
  ),
);
