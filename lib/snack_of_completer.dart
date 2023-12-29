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

void main(List<String> arguments) async {
  Completer completer = Completer();

  () async {
    await Future.delayed(Duration(seconds: 2));
    SnackLogger.log(' ----------- completer done ------------ ');
    completer.complete();
  }();

  Future f = completer.future;
  f.then((value) {
    print('1 done');
  });

  await Future.delayed(Duration(seconds: 5));
  test(f);
}

void test(Future f) {
  print('test come in');
  f.then((value) {
    print('2 done');
  });

  Future.wait([f]).then((value) {
    print('wait done');
  });

  Future.wait([]).then((value) {
    print('empty list future wait done');
  });
}
