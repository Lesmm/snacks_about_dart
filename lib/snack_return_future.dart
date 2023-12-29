import 'dart:async';

Future<int> getData1() async {
  await Future.delayed(Duration(milliseconds: 100));
  print('------ sleep 100ms done');
  return getDataInner();
}

Future<int> getData2() async {
  int v = await getDataInner();
  int a = v + 1;
  print('inter a: $a');
  return v;
}

Future<int> getData3() async {
  await Future.delayed(Duration(milliseconds: 2000));
  print('------ sleep 2000ms done');
  throw Exception('getData3 exception');
  return 10086;
}

Future<int> getDataInner() async {
  await Future.delayed(Duration(milliseconds: 1000));
  return 1;
}

void testDelayThen(Future f) {
  print('${DateTime.now()}>>>>>>>> test invoke or not???');
  f.then((value) {
    print('${DateTime.now()}>>>>>>>> test invoked!!!');
    return 10086;
  });
}

void main(List<String> arguments) async {
  Future f = getData1();
  Future ff = f.then((value) {
    print('>>>>>>>> f then: $value');
    return 66666;
  });
  Future fff = f.then((value) {
    print('>>>>>>>> f then: $value');
    return 77777;
  });
  f.then((value) {
    print('>>>>>>>> f then: $value');
    return 88888;
  });
  ff.then((value) {
    print('>>>>>>>> ff then: $value');
    return 'a';
  });
  fff.then((value) {
    print('>>>>>>>> fff then: $value');
    return 'b';
  });
  await Future.delayed(Duration(milliseconds: 2000));
  testDelayThen(f);
  return;

  Future f1 = getData1().then((value) => 333);
  Future f11 = getData1().then((value) async {
    await Future.delayed(Duration(milliseconds: 1000));
    return 666;
  });
  Future f2 = getData2();
  print('>>>>>>>> f1: $f1, f2: $f2');
  
  () async {
    int i1 = await f1;
    int i11 = await f11;
    int i2 = await f2;
    print('>>>>>>>> i1: $i1, i11: $i11, i2: $i2');
  }();
  Future f3 = getData3();
  f3.then((value) {
    print('f3 =======> $value');
  }).onError((error, stackTrace) {
    print('f3 -------> $error, $stackTrace');
  });

  () async {
    int a = await f3;
    print('await f3: $a');
  } ();
}
