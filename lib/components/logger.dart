import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 2,
      lineLength: 50,
      colors: true,
      printEmojis: false,
    ),
    level: Level.info);
