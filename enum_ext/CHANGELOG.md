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
