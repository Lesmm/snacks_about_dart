import 'dart:async';
import 'dart:convert';

void main(List<String> arguments) {
  start<List>();
  start<List?>();
  start<Map>();
  start<Map<String, dynamic>>();
  start<Map<String, dynamic>?>();

  print('----->>>>> ${[].runtimeType.toString()}');
  dynamic l = json.decode('[1,2,3]');
  dynamic m = json.decode('{}');
  dynamic m1 = json.decode('{"k": "v"}');
  print('----->>>>> ${l.runtimeType.toString()}');
  print('----->>>>> ${m.runtimeType.toString()}');
  print('----->>>>> ${m1.runtimeType.toString()}');
  print('----->>>>> ${m is Map}, ${m1 is Map}');
  print('----->>>>> ${m is Map<dynamic, dynamic>}, ${m1 is Map<dynamic, dynamic>}');

  var a; // = null;
  if (1 < 2) {
    a = null;
  }
  Map? map = a as Map?;
  print('------->>> Done as null cast to any T? no error, map is $map');

  List<Map> b = [{}, {}];
  List<int> c = [1, 2];
  print('------->>> List<Map> is List<dynamic> ? ${b is List<dynamic>}');
  print('------->>> List<int> is List<dynamic> ? ${c is List<dynamic>}');

  checkNum<bool>();
  checkNum<int>();
  checkNum<double>();

  checkList<List>();
  checkList<List?>();

  List<int> ccc = [1, 2, 3];
  List<int?> ddd = ccc;
  List<int?> dddd = ccc as List<int?>;
  print('ddd is ------>>>> $ddd');

  int i1 = 1;
  bool b1 = true;

  print('i1 is ------>>>> ${i1 is Object}');
  print('i1 is ------>>>> ${i1 is num}');
  print('b1 is ------>>>> ${b1 is Object}');
}

void start<T>() {
  print('start T is ------>>>> ${T.toString()}');
}

void checkNum<T>() {
  print('check $T == num ------>>>> ${T == num}');
  print('check $T == int ------>>>> ${T == int}');
  print('check $T == double ------>>>> ${T == double}');
}

void checkList<T>() {
  print('check $T == List ------>>>> ${T == List}');
}