import 'dart:convert';

void main(List<String> arguments) {
  Map map = {'a': 123};
  print('======>>>>>> ${map is Map<String, Object?>}');
  print('======>>>>>> ${map.runtimeType}');

  Map<String, dynamic> m = {'123': 123};
  print('======>>>>>> ${m is Map<String, Object?>}');
  print('======>>>>>> ${m.runtimeType}');

  Map<String, Object?> mm = {'a': 123};
  print('======>>>>>> ${mm is Map<String, Object?>}');
  print('======>>>>>> ${mm.runtimeType}');

  print('done');
}
