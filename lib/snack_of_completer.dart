import 'dart:async';

import 'package:snacks_about_dart/util/snack_logger.dart';

void start() async {
  SnackLogger.log('--------- 1st Test ---------\n');
  Completer completer = Completer();

  () async {
    await Future.delayed(Duration(seconds: 2));
    completer.complete();
  }();

  await completer.future;

  SnackLogger.log('--------- await again ---------\n');
  await completer.future;

  SnackLogger.log('--------- await again ---------\n');
  await completer.future;

  SnackLogger.log('--------- all done ---------\n');
}
