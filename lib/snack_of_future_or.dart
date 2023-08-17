import 'dart:async';

import 'package:snacks_about_dart/util/snack_logger.dart';

void main(List<String> arguments) {
  start();
}

void start() async {
  SnackLogger.log('--------- 1st Test ---------\n');
  value = null;
  await startFutureOrTestASync();
  await Future.delayed(Duration(seconds: 2));
  await startFutureOrTestASync();

  // ...
  await Future.delayed(Duration(seconds: 2));

  SnackLogger.log('--------- 2nd Test ---------\n');
  value = null;
  await startFutureOrTestTime();
  await Future.delayed(Duration(seconds: 2));
  await startFutureOrTestTime();

  // ...
  await Future.delayed(Duration(seconds: 2));

  SnackLogger.log('--------- 3nd Test ---------\n');
  value = null;
  startFutureOrTestIfSafe();
}

/// Test FutureOr
int? value;

FutureOr<int> getValue() {
  if (value == null) {
    return Future.delayed(Duration(seconds: 1), () {
      value = 1;
      return value!;
    });
  } else {
    return value = value! + 1;
  }
}

Future startFutureOrTestASync() async {
  var result = getValue();
  if (result is Future) {
    (result as Future).then((v) {
      SnackLogger.log('Async value: $v');
    });
  } else {
    SnackLogger.log('Sync value: $value');
  }
}

Future startFutureOrTestTime() async {
  int beginTime = DateTime.now().millisecondsSinceEpoch;
  var result = await getValue();
  int overTime = DateTime.now().millisecondsSinceEpoch;
  int cost = overTime - beginTime;
  SnackLogger.log('await Value: $result, Time cost: $cost ms');
}

Future startFutureOrTestIfSafe() async {
  int beginTime = DateTime.now().millisecondsSinceEpoch;
  var result = await getValue();
  int overTime = DateTime.now().millisecondsSinceEpoch;
  int cost = overTime - beginTime;
  SnackLogger.log('await Value: $result, Time cost: $cost ms');

  // cast to int. safe or not?
  int v = getValue() as int;
  SnackLogger.log('HHHHHa~~~~, Safe and in a sync way: $v');

  int vv = await getValue();
  SnackLogger.log('In a same sync or not??? : $vv');
}
