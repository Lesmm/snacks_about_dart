
void main(List<String> arguments) {
  test();
  test(null);
  test('💯');
}

void test([String? string]) {
  print('test value >>> $string');
  if (string is String) {
    print('string is String');
  } else {
    print('string is not String');
  }
}