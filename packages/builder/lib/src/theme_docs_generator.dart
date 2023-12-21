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
  static const _propertyTypes = {
    'Color',
    'int',
    'double',
    'bool',
    'IconThemeData',
    'TextStyle',
  };

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

    final className = element.name.replaceFirst(RegExp(r'Cubit$'), '');
    final apiClassName = config.apiClassName ?? className;
    late final Map<String, String> props;

    if (className == 'ColorTheme') {
      props = (await _getThemeProperties(
        className: 'ThemeData',
        propertyTypes: propertyTypes,
      ))
        ..addAll(
          await _getThemeProperties(
            className: 'ColorScheme',
            propertyTypes: propertyTypes,
            targetPropertyName: 'secondary',
          ),
        );
    } else if (className == 'AppBarTheme') {
      props = await _getThemeProperties(
        className: apiClassName,
        propertyTypes: propertyTypes,
        getSourceDescription: true,
      );
    } else {
      props = await _getThemeProperties(
        className: apiClassName,
        propertyTypes: propertyTypes,
      );
    }

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
    bool getSourceDescription = false,
    String? targetPropertyName,
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

      if (!_shouldProcessProperty(
        element: propElem,
        propertyTypes: propertyTypes,
      )) {
        continue;
      }

      final propName = propElem.querySelector('span.name')!.text;
      if (propName == 'hashCode' ||
          (targetPropertyName != null && targetPropertyName != propName)) {
        continue;
      }

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

  bool _shouldProcessProperty({
    required html_dom.Element element,
    required Set<String> propertyTypes,
  }) {
    final signatureElem = element.querySelector('span.signature')!;
    final propType = signatureElem.querySelector('a')!.text;

    final nestedSignatureElem = signatureElem.querySelector('span.signature');
    final nestedPropType = nestedSignatureElem?.querySelector('a')?.text;

    if ((nestedPropType == null && !propertyTypes.contains(propType)) ||
        (nestedPropType != null && !propertyTypes.contains(nestedPropType))) {
      return false;
    }

    return true;
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
  final String? apiClassName;
  final Set<String>? extraPropertyTypes;

  const _Config({this.apiClassName, this.extraPropertyTypes});

  factory _Config.fromAnnotation(ConstantReader annotation) {
    return _Config(
      apiClassName: annotation.peek('apiClassName')?.stringValue,
      extraPropertyTypes: annotation
          .peek('extraPropertyTypes')
          ?.setValue
          .map((e) => ConstantReader(e).stringValue)
          .toSet(),
    );
  }
}
