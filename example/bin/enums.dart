import 'package:enum_ext/enum_ext.dart';

part 'enums.g.dart';

@EnumExt()
enum Gender {
  @EnumExtValue("m")
  male,
  @EnumExtValue("f")
  female,
  @EnumExtValue("o")
  other,
}
