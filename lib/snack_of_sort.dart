import 'dart:convert';

class Element {
  int value;
  int kind;

  Element(this.value, this.kind);

  @override
  String toString() => 'E($value,$kind)';
}

void main(List<String> arguments) {
  Element e1 = Element(1, 1);
  Element e2 = Element(2, 1);
  Element e3 = Element(3, 1);
  Element e4 = Element(4, 0);
  Element e5 = Element(5, 0);
  Element e6 = Element(6, 0);
  Element e7 = Element(7, 0);

  List<Element> list = [e7, e4, e1, e6, e3, e2, e5];
  print('>>>>>> original: $list');

  // list.sort((a, b) => a.value.compareTo(b.value));
  // print('>>>>>> asc v: $list');
  // list.sort((a, b) => b.value.compareTo(a.value));
  // print('>>>>>> desc v: $list');

  list.sort((a, b) => a.kind.compareTo(b.kind));
  print('>>>>>> asc k: $list');
  list.sort((a, b) => b.kind.compareTo(a.kind));
  print('>>>>>> desc k,: $list');
}
