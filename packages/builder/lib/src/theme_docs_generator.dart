import 'package:analyzer/dart/element/element.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:appainter_builder/src/http_client.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:html/parser.dart' show parse;
import 'package:source_gen/source_gen.dart';

class ThemeDocsGenerator extends GeneratorForAnnotation<ThemeDocs> {
  final HttpClient client;

  const ThemeDocsGenerator({this.client = const HttpClient()}) : super();

  static const _allowedPropertyTypes = {'color', 'double'};

  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Only classes can be annotated with "ThemeDocumentation". "$element" is'
        'not a ClassElement.',
        element: element,
      );
    }

    final className = element.name.replaceFirst(RegExp(r'Cubit$'), '');
    late final Map<String, String> props;
    if (className == 'ColorTheme') {
      props = await _getThemeProperties('ThemeData');
    } else {
      props = await _getThemeProperties(className);
    }

    final buffer = StringBuffer('class ${className}Docs {');
    for (var prop in props.entries) {
      buffer.writeln("static const ${prop.key} = '${prop.value}';");
    }
    buffer.writeln('}');

    return buffer.toString();
  }

  Future<Map<String, String>> _getThemeProperties(
    String className, {
    Set<String> allowedPropertyTypes = _allowedPropertyTypes,
  }) async {
    final res = await client.get(
      'https://api.flutter.dev/flutter/material/$className-class.html',
    );
    final document = parse(res.body);

    final propsElem = document.querySelector('dl.properties')!;
    final propElems = propsElem.getElementsByTagName('dt');
    final propDescElems = propsElem.getElementsByTagName('dd');

    final propsMap = <String, String>{};
    for (var elems in IterableZip([propElems, propDescElems])) {
      final propElem = elems[0];
      final propDescElem = elems[1];

      if (propElem.querySelector('a.deprecated') != null) {
        continue;
      }

      final signatureElem = propElem.querySelector('span.signature')!;
      final propType = signatureElem.querySelector('a')!.text.toLowerCase();
      if (!allowedPropertyTypes.contains(propType)) {
        continue;
      }

      final propName = propElem.querySelector('span.name')!.text;
      propDescElem.querySelector('div')!.remove();
      final propDesc = propDescElem.text
          .replaceFirst('[...]', '')
          .trim()
          .replaceAll(RegExp(r'^\s+', multiLine: true), '')
          .replaceAll('\n', ' ');
      propsMap[propName] = propDesc;
    }

    return propsMap;
  }
}
