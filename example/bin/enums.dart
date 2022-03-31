import 'package:enum_ext/enum_ext.dart';

part 'enums.g.dart';

@EnumExt(conditionalGetters: false)
enum HttpResponse {
  @EnumExtValue(200)
  ok,
  @EnumExtValue(404)
  notFound,
  @EnumExtValue(500)
  internalServerError,
}
