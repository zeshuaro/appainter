import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('render correctly', (tester) async {
      await tester.binding.setSurfaceSize(const Size(2400, 850));
      await app.main();
      await tester.pumpAndSettle();

      expect(find.byType(BasicThemeEditor), findsOneWidget);
    });
  });
}
