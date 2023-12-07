import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('render correctly', (tester) async {
      await tester.binding.setSurfaceSize(const Size(2400, 1080));
      await app.main();

      final finder = find.byType(BasicThemeEditor);
      final end = tester.binding.clock.now().add(const Duration(seconds: 10));

      do {
        if (tester.binding.clock.now().isAfter(end)) {
          throw Exception('Timed out waiting for $finder');
        }

        await tester.pumpAndSettle();
        await Future.delayed(const Duration(milliseconds: 100));
      } while (finder.evaluate().isEmpty);
    });
  });
}
