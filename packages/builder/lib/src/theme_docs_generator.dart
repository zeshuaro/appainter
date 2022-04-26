import 'package:analyzer/dart/element/element.dart' as analyzer;
import 'package:appainter_annotations/annotations.dart';
import 'package:appainter_builder/src/http_client.dart';
import 'package:build/build.dart';
import 'package:collection/collection.dart';
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart' show parse;
import 'package:source_gen/source_gen.dart';
import 'package:textwrap/textwrap.dart';

class ThemeDocsGenerator extends GeneratorForAnnotation<ThemeDocs> {
  final HttpClient client;

  const ThemeDocsGenerator({this.client = const HttpClient()}) : super();

  static const _baseUrl = 'https://api.flutter.dev/flutter';
  static const _propertyTypes = {'Color', 'double', 'bool', 'IconThemeData'};

  @override
  Future<String> generateForAnnotatedElement(
    analyzer.Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element is! analyzer.ClassElement) {
      throw InvalidGenerationSourceError(
        'Only classes can be annotated with "ThemeDocumentation". "$element" is'
        'not a ClassElement.',
        element: element,
      );
    }

    final config = _Config.fromAnnotation(annotation);
    final propertyTypes = Set<String>.from(_propertyTypes);
    if (config.extraPropertyTypes != null) {
      propertyTypes.addAll(config.extraPropertyTypes!);
    }

    var className = element.name.replaceFirst(RegExp(r'Cubit$'), '');
    var getSourceDescription = true;

    if (className == 'ColorTheme') {
      className = 'ThemeData';
      getSourceDescription = false;
    }

    final props = await _getThemeProperties(
      className: className,
      propertyTypes: propertyTypes,
      getSourceDescription: getSourceDescription,
    );

    final buffer = StringBuffer('class ${className}Docs {');
    for (var prop in props.entries) {
      buffer.writeln('static const ${prop.key} = """${prop.value}""";');
    }
    buffer.writeln('}');

    return buffer.toString();
  }

  Future<Map<String, String>> _getThemeProperties({
    required String className,
    required Set<String> propertyTypes,
    bool getSourceDescription = true,
  }) async {
    final res = await client.get('$_baseUrl/material/$className-class.html');
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
      final propType = signatureElem.querySelector('a')!.text;
      if (!propertyTypes.contains(propType)) {
        continue;
      }

      final propName = propElem.querySelector('span.name')!.text;
      String? propDesc;
      if (getSourceDescription) {
        propDesc = await _getPropertyDescription(propName, propDescElem);
      }

      if (propDesc == null) {
        propDescElem.querySelector('div')!.remove();
        propDesc = propDescElem.text;
      }

      final propDescText = propDesc
          .replaceFirst('[...]', '')
          .trim()
          .replaceAll(RegExp(r'^\s+', multiLine: true), '')
          .replaceAll('\n', ' ');
      propsMap[propName] = fill(propDescText);
    }

    return propsMap;
  }

  Future<String?> _getPropertyDescription(
    String name,
    html_dom.Element element,
  ) async {
    final linkElems = element.getElementsByTagName('a');
    try {
      final targetLinkElem = linkElems.firstWhere(
        (element) => element.text.contains(name),
      );
      final url = "$_baseUrl/${targetLinkElem.attributes['href']!}";
      final res = await client.get(url);
      final document = parse(res.body);

      return document
          .querySelector('section.desc.markdown')
          ?.querySelector('p')
          ?.text;
    } on StateError {
      return null;
    }
  }
}

class _Config {
  final Set<String>? extraPropertyTypes;

  const _Config({this.extraPropertyTypes});

  factory _Config.fromAnnotation(ConstantReader annotation) {
    return _Config(
      extraPropertyTypes: annotation
          .peek('extraPropertyTypes')
          ?.setValue
          .map((e) => ConstantReader(e).stringValue)
          .toSet(),
    );
  }
}
