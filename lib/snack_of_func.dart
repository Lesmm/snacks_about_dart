
typedef WriteTranslator<T> = Map<String, Object?> Function(T e, {Map<String, Object?>? exists});

void main(List<String> arguments) {
  test((e, {exists}) {
    return {'a': 1, 'b': 2};
  });
}

void test(WriteTranslator translator) {
  Map<String, Object?> a = translator(123);
}
