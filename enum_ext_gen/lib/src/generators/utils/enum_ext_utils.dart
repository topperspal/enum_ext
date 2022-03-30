import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:enum_ext/enum_ext.dart';
import 'package:enum_ext_gen/src/generators/utils/core_utils.dart';
import 'package:source_gen/source_gen.dart';

final _customValueAnnChecker = const TypeChecker.fromRuntime(EnumExtValue);

String generateCustomPropertiesGetters(String enumName, List<FieldElement> fields) {
  final cases = <String>[];

  for (var f in fields) {
    var value;

    if (_customValueAnnChecker.hasAnnotationOfExact(f)) {
      DartObject? obj = _customValueAnnChecker.firstAnnotationOfExact(f)!.getField('value');

      value = extractValue(obj);
    }

    cases.add("""
      case $enumName.${f.name}:
        return $value;
    """);
  }

  return """
  dynamic get value {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/* -------------------------------------------------------------------------- */
/*                                    When                                    */
/* -------------------------------------------------------------------------- */
String generateWhenMethod(String enumName, List<String> fields) {
  final parameters = <String>[];
  final cases = <String>[];

  for (var f in fields) {
    parameters.add("required void Function($enumName e) $f,");

    cases.add("""
      case $enumName.$f:
        return $f(this);
    """);
  }

  return """
  void when({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/* -------------------------------------------------------------------------- */
/*                                 May Be When                                */
/* -------------------------------------------------------------------------- */
String generateMayBeWhenMethod(String enumName, List<String> fields) {
  final parameters = <String>[];
  final cases = <String>[];

  for (var f in fields) {
    parameters.add("void Function($enumName e)? $f,");

    cases.add("""
      case $enumName.$f:
        return $f==null ? orElse(this) : $f(this);
    """);
  }

  parameters.add("required void Function($enumName e) orElse,");

  return """
  void mayBeWhen<T>({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/* -------------------------------------------------------------------------- */
/*                                  Only When                                 */
/* -------------------------------------------------------------------------- */
String generateOnlyWhenMethod(String enumName, List<String> fields) {
  final parameters = <String>[];
  final cases = <String>[];

  for (var f in fields) {
    parameters.add("void Function($enumName e)? $f,");

    cases.add("""
      case $enumName.$f:
        return $f?.call(this);
    """);
  }

  return """
  void onlyWhen<T>({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/* -------------------------------------------------------------------------- */
/*                                     Map                                    */
/* -------------------------------------------------------------------------- */
String generateMapMethod(String enumName, List<String> fields) {
  final parameters = <String>[];
  final cases = <String>[];

  for (var f in fields) {
    parameters.add("required T Function($enumName e) $f,");

    cases.add("""
      case $enumName.$f:
        return $f(this);
    """);
  }

  return """
  T map<T>({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/* -------------------------------------------------------------------------- */
/*                                 Map Simply                                 */
/* -------------------------------------------------------------------------- */
String generateMapSimplyMethod(String enumName, List<String> fields) {
  final parameters = <String>[];
  final cases = <String>[];

  for (var f in fields) {
    parameters.add("required T $f,");

    cases.add("""
      case $enumName.$f:
        return $f;
    """);
  }

  return """
  T mapSimply<T>({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/* -------------------------------------------------------------------------- */
/*                                 May Be Map                                 */
/* -------------------------------------------------------------------------- */
String generateMayBeMapMethod(String enumName, List<String> fields) {
  final parameters = <String>[];
  final cases = <String>[];

  for (var f in fields) {
    parameters.add(" T Function($enumName e)? $f,");

    cases.add("""
      case $enumName.$f:
        return $f==null ? orElse(this) : $f(this);
    """);
  }

  parameters.add("required T Function($enumName e) orElse,");

  return """
  T mayBeMap<T>({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}
