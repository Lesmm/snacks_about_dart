// ignore_for_file: constant_identifier_names

void main(List<String> arguments) {
  print('------>>>> ${SnackType.Bread}');
  print('------>>>> ${SnackType.Cake}');
  print('------>>>> ${SnackType.Cookie}');

  print('------>>>>${SnackType.Bread.index}: ${SnackType.Bread.name}');
  print('------>>>>${SnackType.Cake.index}: ${SnackType.Cake.name}');
  print('------>>>>${SnackType.Cookie.index}: ${SnackType.Cookie.name}');
}


enum SnackType {
  Bread,
  Cake,
  Cookie,
  Candy,
  IceCream,
  Other,
}
