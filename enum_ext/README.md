Lets make enums 🚀 by adding some useful extension methods.<br />
Say good bye to **switch-case** and **if-else** blocks.

<br />Inspired by [freezed](https://pub.dev/packages/freezed)

## Features
- ### Generate Some Useful Methods
  - when
  - mayBeWhen
  - onlyWhen
  - map
  - mapSimply
  - mayBeMap

- ### Generate Value Checking Getters
- ### Generate Custom Extension Value
- ### Title case of enum name
## Getting started

Add following dependencies -

```yaml
dependencies:
  yaml: ^3.1.0
  enum_ext: ^1.0.0

dev_dependencies:
  build_runner:
  enum_ext_gen: ^1.0.0
```

## Usage

Add the part directive in the file

```dart
part 'file_name.g.dart';
```

# Extension methods

In order to generate extension methods, simply annotate the enum with `@EnumExt()`

```dart
@EnumExt()
enum HttpResponse { ok, notFound, internalServerError }
```

⚙️ Now generate the code using build_runner.
<br />
**Dart only -**

```dart
dart pub run build_runner build
// OR
dart pub run build_runner watch
```

**Flutter -**

```dart
flutter pub run build_runner build
// OR
flutter pub run build_runner watch
```

This will generate all these extension methods for you

```dart
  final response = HttpResponse.internalServerError;

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
```

> Note :- **when()**, `onlyWhen()`, `mayBeWhen()` methods used when do just want **to perform some task** based on specific enum properties, whereas **map()**, `mayBeMap()`, `mapSimply()` methods are used to **return a value** based on the enum.

# Value Checking Getters
It will also generate value checking getter like 
```dart
response.isOk // response == Response.ok
response.isNotOk // response != Response.ok
```

If you do not want to generate **value checking getters**, you can set `conditionalGetters: false` like this
```dart
EnumExt(conditionalGetters: false)
```

# Extension value

In order to generate extension value, annotate enum properties with `@EnumExtValue(...)`
<br />⚠️Note:- Any enum propery that is not annotated with `@EnumExtValue(...)` will simply return `null`
<br />⚠️Note:- Supported values for `@EnumExtValue(...)` are **String, int, double, List, Map, Set** and **Symbol**. Any other vaue will be replaced by `null`

Lets add some extension values to the `HttpResponse` enum

```dart
@EnumExt()
enum HttpResponse {
  @EnumExtValue(200)
  ok,
  @EnumExtValue(404)
  notFound,
  @EnumExtValue(500)
  internalServerError,
}
```

This will generate a getter extension named `value` on the enum.

```dart
  final response = HttpResponse.internalServerError;

  print(response); // HttpResponse.internalServerError
  print(response.index); // 2
  print(response.name); // internalServerError
  print(response.value); // 500 <-- 🔥 Extension
```

# Title case of enum name
It also generate `title` getter extension in order to get **Title Case** of enum property name.

```dart
@EnumExt()
enum HttpResponse { ok, notFound, internalServerError }

void main() {
  final response = HttpResponse.internalServerError;

  print(response.title); // Internal Server Error
}
```

## Please hit a like👍 if this package made your life 🚀
