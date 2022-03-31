class EnumExt {
  /// Whether to create conditional value getters or not
  ///
  ///```dart
  /// @EnumExt()
  /// enum Gender {
  ///   male,
  ///   female,
  ///   other,
  /// }
  /// ```
  ///
  /// Now you can use value checking getters like `gender.isMale`, `gender.isNotMale` etc. instead of `gender == Gender.male` or `gender != Gender.male`
  ///
  final bool conditionalGetters;

  /// __EnumExt__ annotation makes `enum_ext_gen` package to generate some useful methods
  /// in order to rescue us from __switch-case__ and __if-else__ blocks.
  ///
  ///
  const EnumExt({this.conditionalGetters = true});
}

class EnumExtValue {
  final dynamic value;

  /// __EnumExtValue__ annotation generates a custom getter named __value__ for each properties of an enum class.
  ///
  ///
  ///```dart
  /// @EnumExt()
  /// enum HttpResponse {
  ///   @EnumExtValue(200)
  ///   ok,
  ///   @EnumExtValue(404)
  ///   notFound,
  ///   @EnumExtValue(500)
  ///   internalServerError,
  /// }
  ///
  /// void main() {
  ///   print(HttpResponse.ok.value); // 200
  ///   print(HttpResponse.notFound.value); // 404
  ///   print(HttpResponse.internalServerError.value); // 500
  /// }
  ///  ```
  ///
  /// ⚠️Note:- Any enum propery that is not annotated with `@EnumExtValue(...)` will simply return `null`
  ///
  /// ⚠️Note:- Supported values for `@EnumExtValue(...)` are
  /// **String, int, double, List, Map, Set** and **Symbol**.
  /// Any other vaue will be replaced by `null`
  const EnumExtValue(this.value);
}
