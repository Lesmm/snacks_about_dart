import 'dart:convert';

void main(List<String> arguments) {

  List<String> nonces = [];
  List<String> fields = ['count(1)'];
  List<String> columns = ['type', 'id', 'value'];

  String str0 = nonces.join(', ');
  String str1 = fields.join(', ');
  String str2 = columns.join(', ');

  num a = 1.001;
  int b = 1;
  double c = 2.001;
  double d = 1;
  double e = 1.00;

  print('======>>>>>>a ${a == 1}');
  print('======>>>>>>b ${b == 1}');
  print('======>>>>>>c ${c == 1}');
  print('======>>>>>>d ${d == 1}');
  print('======>>>>>>e ${e == 1}');

  List<Object> aaa = List<int>.from(json.decode('[1,2,3]'));

  List<dynamic> jsonList = json.decode('[1,2,3]') as List;
  List<Object?> bbb = List<Object?>.from(jsonList);

  List<Object?> list1 = aaa;
  List<dynamic> list2 = bbb;

  print('ok');

  print('======>>>>>> ${aaa is List<dynamic>}');
  print('======>>>>>> ${bbb is List<dynamic>}');
  print('======>>>>>> ${jsonList is List<Object?>}');
  print('======>>>>>> ${List<dynamic> == List<Object?>}');

  List<int> checked = json.decode('[1,2,3]');

  print('done');
}
