// ignore_for_file: constant_identifier_names

import 'dart:async';

void main(List<String> arguments) {
  () async {
    start();
    await Future.delayed(Duration(seconds: 2));
    start();

    await Future.delayed(Duration(seconds: 2));
    print('\n------------- Test without async --------------\n');

    startWithout();
    await Future.delayed(Duration(seconds: 2));
    startWithout();
  }();
}

/// ------------------------

void start() {
  var f = snack_of_async();
  print('Got ------>>>> $f');
  if (f is Future) {
    print('------>>>> $f is Future');
    (f as Future).then((value) {
      print('------>>>> then got value: $value');
    });
  } else {
    print('------>>>> $f is not Future');
  }
}

int value = 1;

FutureOr<int> snack_of_async() async {
  print('snack_of_sync start');
  if (value != 1) {
    print('snack_of_sync just return $value');
    return value;
  }
  await Future.delayed(Duration(seconds: 1));
  value = value + 1;
  print('snack_of_sync return a future $value');
  return value;
}

/// ------------------------

void startWithout() {
  var f = snack_of_without_async();
  print('Got ------>>>> $f');
  if (f is Future) {
    print('------>>>> $f is Future');
    (f as Future).then((value) {
      print('------>>>> then got value: $value');
    });
  } else {
    print('------>>>> $f is not Future');
  }
}

int valueWithout = 1;

FutureOr<int> snack_of_without_async() {
  print('snack_of_sync start');
  if (valueWithout != 1) {
    print('snack_of_sync just return $valueWithout');
    return valueWithout;
  }
  return Future.delayed(Duration(seconds: 1), () {
    valueWithout = valueWithout + 1;
    print('snack_of_sync return a future $valueWithout');
    return valueWithout;
  });
}
