// ignore_for_file: constant_identifier_names

import 'dart:async';

void main(List<String> arguments) async {
  print('Got ------>>>> 1');
  start();
  print('Got ------>>>> 2');
  Future f = startAsyncFake();
  f.then((value) {
    print('Got ------>>>> then executed');
  });
  await f;
  print('Got ------>>>> 3');
}

void start() {
  print('Got ------>>>> start');
}

Future<void> startAsyncFake() async {
  print('Got ------>>>> startAsyncFake');
}
