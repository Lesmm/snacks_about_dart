import 'dart:async';
import 'dart:convert';

void main(List<String> arguments) {
  {
    List<bool> list = [true, false];
    pass(list);
    List<bool?> listNullable = list as List<bool?>;
    pass(listNullable);
    listNullable = [false, null];
    pass(listNullable);
  }

  startCheck();

  {
    print('checkType: value 1 ');
    Map? checkVal1 = checkTypeIsMap<Map>({'key': 'value'});
    print('checkType: value 2 ');
    Map? checkVal2 = checkTypeIsMap<Map?>({'key': 'value'});

    print('checkType: value 3 ');
    List? checkVal3 = checkTypeIsMap<List>([]);
    print('checkType: value 4 ');
    List? checkVal4 = checkTypeIsMap<List?>([]);
  }

  {
    print('checkType: value 1 ');
    int? checkVal1 = checkTypeIsInt<int>(0);
    print('checkType: value 2 ');
    int? checkVal2 = checkTypeIsInt<int?>(null);

    print('checkType: value 3 ');
    List? checkVal3 = checkTypeIsInt<List>([]);
    print('checkType: value 4 ');
    List? checkVal4 = checkTypeIsInt<List?>([]);
  }

  print('checkType: dynamic 1 ');
  int? checkVal1 = checkTypeIsInt<dynamic>(0);
}

void pass(List<bool?> list) {
  print('########### pass: $list');
}

void startCheck() {
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

T? checkTypeIsMap<T>(T value) {
  print('checkType T is ------>>>> ${T.toString()}, null is T: ${null is T}');
  if (isType<Map>(T)) {
    print('checkType T is Map');
  }
  if (isNullableType<Map>(T)) {
    print('checkType T is nullable Map');
  }

  if (isTypeIgnoreNull<T, Map>()) {
    print('💯 is Map type ignore nullable');
  }
  return value;
}

T? checkTypeIsInt<T>(T value) {
  print('checkType T is ------>>>> ${T.toString()}');
  if (isType<int>(T)) {
    print('checkType T is int');
  }
  if (isNullableType<int>(T)) {
    print('checkType T is nullable int');
  }
  if (isNullableType<int?>(T)) {
    print('checkType T is nullable int double-check');
  }
  return value;
}

bool isType<T>(Type type) => type == T;

bool isNullableType<T>(Type type) => isType<T?>(type);


bool isTypeOf<T, S>() => T == S;

bool isTypeIgnoreNull<T, S>() => isTypeOf<T, S>() || isTypeOf<T, S?>() ;