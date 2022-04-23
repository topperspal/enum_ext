## 1.4.0

- **Breaking** - `value` getter is replaced with `extValue`
- **Features Added** - 
    - Now the eunm property can be accessed with `byExtValue()` like `byName()` from values.

## 1.3.2

Removed unused dependency `recase`.

## 1.3.1

**Breaking** - Now `title` getter will be generated, you do not need to `import package:enum_ext/enum_ext.dart` package anymore in order to use this. Instead import the file containing enum.

## 1.3.0

**Breaking** - Removed all cases (`snackCase, camelCase, dotCase, headerCase` etc.) in order to make enum more robust and clean

Now it generate `title` getter extension in order to get title case of enum property name
```dart
@EnumExt()
enum HttpResponse {
  ok,
  notFound,
  internalServerError,
}

void main() {
  print(HttpResponse.ok.title); // Ok
  print(HttpResponse.notFound.title); // Not Found
  print(HttpResponse.internalServerError.title); // Internal Server Error
}
```
## 1.2.0

- Generating value checking getters like `is...` and `isNot...`
<br />**Example**
```dart
@EnumExt()
enum Gender { male, female, other }

// This will generate isMale, isNotMale, isFemale, isNotFemale, 
// isOther, isNotOther getters

void main() {
  final gender = Gender.male;

  // Now you can use

  gender.isMale; // Instead of gender == Gender.male
  gender.isFemale; // Instead of gender == Gender.female
}
```

## 1.1.0

- Added change enum name case extension using [recase](https://pub.dev/packages/recase)
- Improved **Readme** file
- Improved docs
## 1.0.0

- Initial version.
