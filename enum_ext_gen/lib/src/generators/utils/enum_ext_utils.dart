import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:enum_ext/enum_ext.dart';
import 'package:enum_ext_gen/src/generators/utils/core_utils.dart';
import 'package:recase/recase.dart';
import 'package:source_gen/source_gen.dart';

final _customValueAnnChecker = const TypeChecker.fromRuntime(EnumExtValue);

String generateCustomPropertiesGetters(
    String enumName, List<FieldElement> fields) {
  final cases = <String>[];

  for (var f in fields) {
    // ignore: prefer_typing_uninitialized_variables
    var value;

    if (_customValueAnnChecker.hasAnnotationOfExact(f)) {
      DartObject? obj =
          _customValueAnnChecker.firstAnnotationOfExact(f)!.getField('value');

      value = extractValue(obj);
    }

    cases.add("""
      case $enumName.${f.name}:
        return $value;
    """);
  }

  return """
  dynamic get extValue {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

String generateEnumByCustomPropertySelector(
    String enumName, List<FieldElement> fields) {
  final cases = <String>[];

  for (var f in fields) {
    // ignore: prefer_typing_uninitialized_variables

    if (_customValueAnnChecker.hasAnnotationOfExact(f)) {
      DartObject? obj =
          _customValueAnnChecker.firstAnnotationOfExact(f)!.getField('value');
      var value = extractValue(obj);

      cases.add("""
      case $value:
        return $enumName.${f.name};
    """);
    }
  }

  return """
extension ${enumName}ArrayExt on List<$enumName> {
  $enumName byExtValue(dynamic value) {
    switch(value) {
      ${cases.join()}
      default:
        throw ArgumentError.value(value, "extValue", "No enum value with that extension value");
    }
  }
}
""";
}

/// Generates `title` getter on enum
///
/// ```dart
/// enum HttpResponse { ok, notFound, internalServerError }
/// ...
/// print(HttpResponse.ok); // Ok
/// print(HttpResponse.notFound); // Not Found
/// print(HttpResponse.internalServerError); // Internal Server Error
String generateTitleGetter(String enumName, List<FieldElement> fields) {
  final cases = <String>[];

  for (var f in fields) {
    cases.add("""
      case $enumName.${f.name}:
        return "${ReCase(f.name).titleCase}";
    """);
  }

  return """
/// ```dart
/// enum HttpResponse { ok, notFound, internalServerError }
///
/// final response = HttpResponse.internalServerError;
/// print(response.titleCase); // Internal Server Error
/// ```
  String get title {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}

/// Generates value checking getters like `is...` and `isNot...`
///
/// ```dart
/// enum HttpResponse { ok, notFound, internalServerError }
/// ...
/// final response = HttpResponse.ok;
/// if(response.isOk) {
///   print("Success");
/// }
String generateValueCheckingGetters(
    String enumName, List<FieldElement> fields) {
  final buffer = StringBuffer();

  for (var f in fields) {
    buffer.writeln(
        "bool get is${f.name[0].toUpperCase()}${f.name.substring(1)} => this == $enumName.${f.name};");
    buffer.writeln(
        "bool get isNot${f.name[0].toUpperCase()}${f.name.substring(1)} => this != $enumName.${f.name};");
  }

  return buffer.toString();
}

/* -------------------------------------------------------------------------- */
/*                                    When                                    */
/* -------------------------------------------------------------------------- */
/// Generates `when()` extension method
///
/// ```dart
/// enum HttpResponse { ok, notFound, internalServerError }
/// ...
/// final response = HttpResponse.ok;
/// if(response.isOk) {
///   print("Success");
/// }
/// response.when(
///   ok: () {},
///   notFound: () {},
///   internalServerError: () {},
/// )
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
  /// Use `when()` method when you want to perform some action based on the enum
  /// 
  /// ```dart
  /// response.when(
  ///   ok: (e) {
  ///     // Do some actions only if the response is HttpResponse.ok
  ///   },
  ///   notFound: (e) {
  ///     // Do some actions only if the response is HttpResponse.notFound
  ///   },
  ///   internalServerError: (e) {
  ///     // Do some actions only if the response is HttpResponse.internalServerError
  ///   },
  /// );
  /// ```
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
  /// Use `mayBeWhen()` method when you want to perform 
  /// some action on a specific enum, if the value is not desired value, 
  /// `orElse` bloc will be executed,
  ///
  /// ```dart
  /// response.mayBeWhen(
  ///   ok: (e) {
  ///     // Do some actions only if the response is HttpResponse.ok
  ///   },
  ///   orElse: (e) {
  ///     // Do some action if response is everything else but Response.ok
  ///   },
  /// );
  /// ```
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
  /// Use `onlyWhen()` method when you want to perform 
  /// some action on some specific enum and avoid the others,
  ///
  /// ```dart
  /// response.onlyWhen(
  ///   ok: (e) {
  ///     // Do some actions only if the response is HttpResponse.ok
  ///   },
  /// );
  /// ```
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
  /// Use `map()` method when you want to return a value based on specific enum
  /// 
  /// ```dart
  /// final message = response.map(
  ///   ok: (e) {
  ///     return "Success!";
  ///   },
  ///   notFound: (e) {
  ///     return "(404) Not Found!";
  ///   },
  ///   internalServerError: (e) {
  ///     return "Something went wrong!";
  ///   },
  /// );
  /// ```
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
  /// It is similar to `map()` method but this time you will return value without function callback.
  /// 
  /// ```dart
  /// final message = response.mapSimply(
  ///   ok: "Success!",
  ///   notFound: "(404) Not Found!",
  ///   internalServerError: "Something went wrong!",
  /// );
  /// ```
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
  /// Use `mayBeMap()` method when you want to return a value based on specific enum, other (`orElse`) for rest.
  /// 
  /// ```dart
  /// final message = response.mayBeMap(
  ///   ok: (e) {
  ///     return "Success!";
  ///   },
  ///   orElse: (e) {
  ///     return "Failure!";
  ///   },
  /// );
  /// ```
  T mayBeMap<T>({
    ${parameters.join()}
  }) {
    switch(this) {
      ${cases.join()}
    }
  }
""";
}
