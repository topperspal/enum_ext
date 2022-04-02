import 'package:analyzer/dart/constant/value.dart';

dynamic extractValue(DartObject? obj) {
  if (obj == null) return null;

  if (!obj.hasKnownValue) return obj;

  if (obj.type!.isDartCoreBool) return obj.toBoolValue();
  if (obj.type!.isDartCoreString) return "\"${obj.toStringValue()}\"";
  if (obj.type!.isDartCoreInt) return obj.toIntValue();
  if (obj.type!.isDartCoreDouble) return obj.toDoubleValue();
  if (obj.type!.isDartCoreSymbol) return obj.toSymbolValue();
  if (obj.type!.isDartCoreList) {
    return obj.toListValue()!.map((e) => extractValue(e)).toList();
  }
  if (obj.type!.isDartCoreSet) {
    return obj.toSetValue()!.map((e) => extractValue(e)).toSet();
  }
  if (obj.type!.isDartCoreMap) {
    return obj
        .toMapValue()!
        .map((k, v) => MapEntry(extractValue(k), extractValue(v)));
  }

  return null;
}
