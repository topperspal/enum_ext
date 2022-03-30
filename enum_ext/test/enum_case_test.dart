import 'dart:io';

import 'package:test/test.dart';
import 'package:enum_ext/enum_ext.dart';

import '../example/main.dart';

void main() {
  test('Enum case tests', () {
    final response = HttpResponse.internalServerError;

    print("print(response.camelCase); // ${response.camelCase}");
    print("print(response.constantCase); // ${response.constantCase}");
    print("print(response.dotCase); // ${response.dotCase}");
    print("print(response.headerCase); // ${response.headerCase}");
    print("print(response.paramCase); // ${response.paramCase}");
    print("print(response.pascalCase); // ${response.pascalCase}");
    print("print(response.pathCase); // ${response.pathCase}");
    print("print(response.sentenceCase); // ${response.sentenceCase}");
    print("print(response.snakeCase); // ${response.snakeCase}");
    print("print(response.titleCase); // ${response.titleCase}");
  });
}
