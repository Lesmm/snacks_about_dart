// ignore_for_file: constant_identifier_names

import 'dart:async';

void main(List<String> arguments) {
  List<String> list = [];
  for (int i = 0; i < 10; i++) {
    list.add('item $i');
  }

  () async {
    for (int i = 0; i < list.length; i++) {
      print('item: ${list[i]}, length: ${list.length}');
      await Future.delayed(Duration(seconds: 2));
    }

    // Unhandled exception:
    // Concurrent modification during iteration: Instance(length:11) of '_GrowableList'.
    // for (String item in list) {
    //   print('item: $item');
    //   await Future.delayed(Duration(seconds: 2));
    // }
  }();

  () async {
    await Future.delayed(Duration(seconds: 1));
    list.add('item 10');
    await Future.delayed(Duration(seconds: 1));
    list.add('item 11');
    await Future.delayed(Duration(seconds: 1));
    list.add('item 12');
    await Future.delayed(Duration(seconds: 1));
    list.add('item 13');
    await Future.delayed(Duration(seconds: 1));
    list.add('item 14');
  }();
}
