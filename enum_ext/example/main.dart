import 'package:enum_ext/enum_ext.dart';

part 'main.g.dart';

@EnumExt()
enum HttpResponse {
  @EnumExtValue(200)
  ok,
  @EnumExtValue(404)
  notFound,
  @EnumExtValue(500)
  internalServerError,
}

void main(List<String> arguments) {
  final response = HttpResponse.internalServerError;

  print(response); // HttpResponse.ok
  print(response.name); // ok
  print(response.index); // 0
  print(response.value); // 200

  response.when(
    ok: (e) {
      // Do some actions only if the response is HttpResponse.ok
    },
    notFound: (e) {
      // Do some actions only if the response is HttpResponse.notFound
    },
    internalServerError: (e) {
      // Do some actions only if the response is HttpResponse.internalServerError
    },
  );

  response.mayBeWhen(
    ok: (e) {
      // Do some actions only if the response is HttpResponse.ok
    },
    orElse: (e) {
      // Do some actions only if the response is something other than HttpResponse.ok
    },
  );

  response.onlyWhen(
    ok: (e) {
      // Do some actions only if the response is HttpResponse.ok
    },
  );

  final value = response.map(
    ok: (e) => "Some value based on HttpResponse.ok",
    notFound: (e) => "Some value based on HttpResponse.notFound",
    internalServerError: (e) => "Some value based on HttpResponse.internalServerError",
  );

  final skinType = response.mapSimply(
    ok: "Some value based on HttpResponse.ok",
    notFound: "Some value based on HttpResponse.notFound",
    internalServerError: "Some value based on HttpResponse.internalServerError",
  );

  print(response.camelCase); // internalServerError
  print(response.constantCase); // INTERNAL_SERVER_ERROR
  print(response.dotCase); // internal.server.error
  print(response.headerCase); // Internal-Server-Error
  print(response.paramCase); // internal-server-error
  print(response.pascalCase); // InternalServerError
  print(response.pathCase); // internal/server/error
  print(response.sentenceCase); // Internal server error
  print(response.snakeCase); // internal_server_error
  print(response.titleCase); // Internal Server Error
}
