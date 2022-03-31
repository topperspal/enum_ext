import 'dart:io';

import 'enums.dart';

void main(List<String> arguments) {
  final response = HttpResponse.ok;

  print(response); // HttpResponse.ok
  print(response.name); // ok
  print(response.index); // 0
  print(response.value); // 200
  print(response.title); // Ok
}
