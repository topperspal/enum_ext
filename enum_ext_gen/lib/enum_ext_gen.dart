library enum_ext_gen;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generators/enum_ext_generator.dart';

Builder enumExtGenerator(BuilderOptions options) =>
    SharedPartBuilder([EnumExtGenerator()], 'enumExtGenerator');
