import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;

void main(List<String> arguments) {
  Map data = {
    "key": "value",
    "url": "https:://www.baidu.com",
    "path": "oms/pic/2023/11-17/15-52-060279807819038.jpg",
  };
  String jsonString1 = jsonEncode(data);
  String jsonString2 = json.encode(data);
  String md5String = json.encode(data).md5;
  print('############## $md5String');
}


extension StringEx on String {

  String get md5 {
    final bytes = utf8.encode(this);
    return crypto.md5.convert(bytes).toString();
  }

}