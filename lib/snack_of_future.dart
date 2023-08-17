import 'dart:async';

import 'package:snacks_about_dart/util/snack_logger.dart';

void start() async {
  SnackLogger.log('---------------------->>>>>>> start future test');
  Future ff1 = Future(() {
    SnackLogger.log('##### Future ff1 body proceed!!!');
  });

  Future<dynamic> ff2 = Future<dynamic>(
    () => SnackLogger.log('##### Future<dynamic> ff2 body excuted!!!'),
  );

  SnackLogger.log('---------------------->>>>>>> start wait test');
  Future f1 = Future.delayed(Duration(seconds: 2), () {
    SnackLogger.log('f1 done');
    return 'f1';
  });

  Future f2 = Future.delayed(Duration(seconds: 1), () {
    SnackLogger.log('f2 done');
    return 'f2';
  });

  Future.wait([]).then((value) {
    SnackLogger.log('Future.wait empty done');
  });

  Future.wait([f1]).then((value) {
    SnackLogger.log('Future.wait f1 done');
  });

  Future.wait([f2]).then((value) {
    SnackLogger.log('Future.wait f2 done');
  });

  await Future.wait([f1, f2]).then((value) {
    SnackLogger.log('Future.wait f1 & f2 all done $value');
  });

  startWithError().then((value) {
    SnackLogger.log('---------------------->>>>>>> startWithError DONE');
  }).onError((error, stackTrace) {
    SnackLogger.log('---------------------->>>>>>> startWithError ERROR');
  });
}

Future<void> startWithError() async {
  SnackLogger.log('---------------------->>>>>>> startWithError 1');
  Future f1 = Future.delayed(Duration(seconds: 2), () {
    SnackLogger.log('f1 throw');
    throw Exception('f1 exception');
  });

  Future f2 = Future.delayed(Duration(seconds: 1), () {
    SnackLogger.log('f2 throw');
    throw Exception('f2 exception');
  });
  await Future.wait([f1, f2]).then((value) {
    SnackLogger.log('Future.wait f1 & f2 all done $value');
  }).onError((error, stackTrace) {
    SnackLogger.log('---->>>> $error, $stackTrace');
  });

  SnackLogger.log('---------------------->>>>>>> startWithError 2');
  f1 = Future.delayed(Duration(seconds: 2), () {
    SnackLogger.log('f1 throw');
    throw Exception('f1 exception');
  });

  f2 = Future.delayed(Duration(seconds: 1), () {
    SnackLogger.log('f2 done');
    return 'f2';
  });
  await Future.wait([f1, f2]).then((value) {
    SnackLogger.log('Future.wait f1 & f2 all done $value');
  }).onError((error, stackTrace) {
    SnackLogger.log('---->>>> $error, $stackTrace');
  });
}
