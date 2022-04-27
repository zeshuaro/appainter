import 'package:appainter_builder/src/http_client.dart';
import 'package:appainter_builder/src/theme_docs_generator.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';
import 'package:build_test/build_test.dart';

import 'mocks.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockResponse extends Mock implements Response {}

void main() {
  late PartBuilder builder;
  late HttpClient client;
  late Map<String, String> assets;

  setUp(() {
    client = MockHttpClient();
    final generator = ThemeDocsGenerator(client: client);
    builder = PartBuilder([generator], '.g.dart');

    assets = {
      'appainter_annotations|lib/annotations.dart': mockAnnotations,
      'appainter_annotations|lib/src/theme_docs.dart': mockThemeDocs,
    };

    final Response response = MockResponse();
    when((() => response.body)).thenReturn(mockPropertiesHtml);
    when(() => client.get(any())).thenAnswer(
      (invocation) => Future.value(response),
    );
  });

  test('generates theme docs', () async {
    assets.addAll({'builder_test|lib/test.dart': mockInput});
    final outputs = {'builder_test|lib/test.g.dart': expectedOutput};

    await testBuilder(
      builder,
      assets,
      outputs: outputs,
      rootPackage: 'builder_test',
    );
    verify(() => client.get(any())).called(1);
  });

  test('generates theme docs with extra properties', () async {
    assets.addAll({'builder_test|lib/test.dart': mockInputExtra});
    final outputs = {'builder_test|lib/test.g.dart': expectedOutputExtra};

    await testBuilder(
      builder,
      assets,
      outputs: outputs,
      rootPackage: 'builder_test',
    );
    verify(() => client.get(any())).called(1);
  });

  test('calls to theme data docs for color theme', () async {
    assets.addAll({'builder_test|lib/test.dart': mockColorThemeInput});

    await testBuilder(
      builder,
      assets,
      rootPackage: 'builder_test',
    );
    verify(
      () => client.get(
        'https://api.flutter.dev/flutter/material/ThemeData-class.html',
      ),
    ).called(1);
    verify(
      () => client.get(
        'https://api.flutter.dev/flutter/material/ColorScheme-class.html',
      ),
    ).called(1);

    // Should not make any additional GET calls to fetch the descriptions
    verifyNever(() => client.get(any()));
  });
}
