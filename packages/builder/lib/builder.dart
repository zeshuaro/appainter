library appainter_builder;

import 'package:build/build.dart';
import 'package:appainter_builder/src/theme_docs_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateThemeDocs(BuilderOptions _) {
  return SharedPartBuilder([const ThemeDocsGenerator()], 'themeDocsGenerator');
}
