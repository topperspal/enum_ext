import 'package:recase/recase.dart';

/// Change the case of the enum names in order display in text or console
extension EnumExtCase on Enum {
  // /// Change the case of the enum name to `camelCase`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.camelCase); // internalServerError
  // /// ```
  // String get camelCase => ReCase(name).camelCase;

  // /// Change the case of the enum name to `CONSTANT_CASE`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.constantCase); // INTERNAL_SERVER_ERROR
  // /// ```
  // String get constantCase => ReCase(name).constantCase;

  // /// Change the case of the enum name to `dot.case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.dotCase); // internal.server.error
  // /// ```
  // String get dotCase => ReCase(name).dotCase;

  // /// Change the case of the enum name to `Header-Case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.headerCase); // Internal-Server-Error
  // /// ```
  // String get headerCase => ReCase(name).headerCase;

  // /// Change the case of the enum name to `param-case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.paramCase); // internal-server-error
  // /// ```
  // String get paramCase => ReCase(name).paramCase;

  // /// Change the case of the enum name to `PascalCase`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.pascalCase); // InternalServerError
  // /// ```
  // String get pascalCase => ReCase(name).pascalCase;

  // /// Change the case of the enum name to `path/case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.pathCase); // internal/server/error
  // /// ```
  // String get pathCase => ReCase(name).pathCase;

  // /// Change the case of the enum name to `Sentence case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.sentenceCase); // Internal server error
  // /// ```
  // String get sentenceCase => ReCase(name).sentenceCase;

  // /// Change the case of the enum name to `snake_case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.snakeCase); // internal_server_error
  // /// ```
  // // String get snakeCase => ReCase(name).snakeCase;

  // /// Change the case of the enum name to `Title Case`
  // ///
  // /// ```dart
  // /// enum HttpResponse { ok, notFound, internalServerError }
  // ///
  // /// final response = HttpResponse.internalServerError;
  // /// print(response.titleCase); // Internal Server Error
  // /// ```
  // String get title => ReCase(name).titleCase;
}
