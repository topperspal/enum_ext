import 'package:analyzer/dart/element/element.dart';
// ignore: implementation_imports
import 'package:build/src/builder/build_step.dart';
import 'package:enum_ext/enum_ext.dart';
import 'package:enum_ext_gen/src/generators/utils/enum_ext_utils.dart';
import 'package:source_gen/source_gen.dart';

class EnumExtGenerator extends GeneratorForAnnotation<EnumExt> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final enumName = element.name;

    final shouldGenerateValueCheckers =
        annotation.read("conditionalGetters").boolValue;

    final e = element as ClassElement;

    final fields = e.fields; // remove values
    fields.removeLast();
    final fieldNames = fields.map((e) => e.name).toList();

    final StringBuffer buffer =
        StringBuffer("extension ${enumName}Ext on $enumName {");

    buffer.writeln(generateCustomPropertiesGetters(enumName!, fields));
    buffer.writeln(generateTitleGetter(enumName, fields));
    if (shouldGenerateValueCheckers) {
      buffer.writeln(generateValueCheckingGetters(enumName, fields));
    }

    buffer.writeln(generateWhenMethod(enumName, fieldNames));
    buffer.writeln(generateMayBeWhenMethod(enumName, fieldNames));
    buffer.writeln(generateOnlyWhenMethod(enumName, fieldNames));
    buffer.writeln(generateMapMethod(enumName, fieldNames));
    buffer.writeln(generateMapSimplyMethod(enumName, fieldNames));
    buffer.writeln(generateMayBeMapMethod(enumName, fieldNames));

    // buffer.write();

    buffer.writeln("}");

    return buffer.toString();
  }
}
