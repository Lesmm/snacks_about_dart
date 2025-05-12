import 'dart:async';

import 'package:snacks_about_dart/util/snack_logger.dart';

void main() async {
  SnackLogger.log('---------------------->>>>>>> start future test');
  Future ff1 = Future(() async {
    SnackLogger.log('##### Future ff1 body proceed start');
    await Future.delayed(Duration(seconds: 1));
    SnackLogger.log('##### Future ff1 body proceed over');
  });

  Future ff2 = Future(() async {
    SnackLogger.log('##### Future ff2 body proceed start');
    await Future.delayed(Duration(seconds: 2));
    SnackLogger.log('##### Future ff2 body proceed over');
  });

  Future ff3 = Future(() async {
    SnackLogger.log('##### Future ff3 body proceed start');
    await Future.delayed(Duration(milliseconds: 1500));
    throw Exception('FF3 EXCEPTION');
  });

  try {
    final result = await Future.wait([ff1, ff2, ff3]);
  } catch (e, s) {
    SnackLogger.log('##### Future all body proceed error: $e\n$s');
  }

  Future<List>? result;
  try {
    result = Future.wait([ff1, ff2, ff3]);
  } catch (e, s) {
    SnackLogger.log('##### Future all body proceed error: $e\n$s');
  }
  result?.catchError((e, s) {
    SnackLogger.log('##### Future all body proceed error: $e\n$s');
    return [];
  });
}
