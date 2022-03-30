import 'package:enum_ext/enum_ext.dart';

part 'main.g.dart';

void main(List<String> arguments) {
  final gender = Gender.male;

  print(gender); // Gender.male
  print(gender.index); // 0
  print(gender.name); // male
  print(gender.value); // m

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

  // final color = gender.mayBeMap(
  //   male: (e) => Colors.white,
  //   orElse: (e) => Colors.pink,
  // );
}

@EnumExt()
enum Gender {
  @EnumExtValue("m")
  male,
  @EnumExtValue("f")
  female,
  @EnumExtValue("o")
  other
}
