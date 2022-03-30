import 'dart:io';

import 'enums.dart';

void main(List<String> arguments) {
  final gender = HttpResponse.ok;

  print(gender); // HttpResponse.ok
  print(gender.name); // ok
  print(gender.index); // 0
  print(gender.value); // 200
}
