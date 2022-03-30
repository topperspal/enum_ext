Lets make enums 🚀**SUPER** by adding some useful extension methods.<br />
Say good bye to **switch-case** and **if-else** blocks.

<br />Inspired by [freezed](https://pub.dev/packages/freezed)

## Features

- ### Generate some useful methods
  - when
  - mayBeWhen
  - onlyWhen
  - map
  - mapSimply
  - mayBeMap
- ### Generate custom extension value

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
part 'my_enums.g.dart';
```

## Extension methods

In order to generate extension methods, simply annotate the enum with `@EnumExt()`

```dart
@EnumExt()
enum Gender {
  male,
  female,
  other
}
```

⚙️ Now generate the code using build_runner.
<br />Dart only -

```
dart pub run build_runner build
// OR
dart pub run build_runner watch
```

Flutter -

```
flutter pub run build_runner build
// OR
flutter pub run build_runner watch
```

This will generate all these extension methods for you

```dart
final gender = Gender.male;

gender.when(
    male: (e) {
      // Do some actions only if the gender is male
    },
    female: (e) {
      // Do some actions only if the gender is female
    },
    other: (e) {
      // Do some actions only if the gender is other
    },
  );

  gender.mayBeWhen(
    male: (e) {
      // Do some actions only if the gender is male
    },
    orElse: (e) {
      // Do some actions only if the gender is not male
    },
  );

  gender.onlyWhen(
    male: (e) {
      // Do some actions only if the gender is male
    },
  );

  final value = gender.map(
    male: (e) => "Male value",
    female: (e) => "Female value",
    other: (e) => "Other value",
  );

  final skinType = gender.mapSimply(
    male: "Hard",
    female: "Soft",
    other: "MayBeSoft",
  );

  final color = gender.mayBeMap(
    male: (e) => Colors.white,
    orElse: (e) => Colors.pink,
  );
```

> Note :- **when()**, `onlyWhen()`, `mayBeWhen()`** methods used when do just want \***to perform some task**\* based on specific enum property, whereas **map**, `mayBeMap()`, `mapSimply()` methods are used to \***return a value\*\*\* based on the enum.

## Extension value:-

In order to generate extension value, annotate enum properties with `@EnumExtValue(...)`
<br />⚠️ Any enum propery that is not annotated with `@EnumExtValue(...)` will simply return `null`
<br />⚠️ Supported values for `@EnumExtValue(...)` are **String, int, double, List, Map, Set** and **Symbol**. Any other vaue will be replaced by `null`

Lets add some extension values to the **Gender** enum

```dart
@EnumExt()
enum Gender {
  @EnumExtValue("m")
  male,
  @EnumExtValue("f")
  female,
  @EnumExtValue("o")
  other
}
```

This will generate a getter extension named `value` on the enum.

```dart
  final gender = Gender.male;

  print(gender); // Gender.male
  print(gender.index); // 0
  print(gender.name); // male
  print(gender.value); // m <-- 🔥 Extension
```

## Please hit a like👍 if this package made your life 🚀
