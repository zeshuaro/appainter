import 'package:appainter/home/home.dart';
import 'package:appainter/theme_preview/theme_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../pump_app.dart';

void main() {
  late HomeCubit homeCubit;

  setUpAll(() {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeThemeData());
  });

  setUp(() {
    homeCubit = MockHomeCubit();
    when(() => homeCubit.state).thenReturn(const HomeState());
    when(() => homeCubit.themeUsageFetched()).thenAnswer((_) async => {});
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpApp(const ThemePreview(), homeCubit: homeCubit);
  }

  testWidgets('should display ThemePreview', (tester) async {
    await pumpApp(tester);
    expect(find.byType(ThemePreview), findsOneWidget);
  });

  testWidgets(
    'should display ButtonsPage',
    (tester) async {
      await pumpApp(tester);

      final finder = find.byWidgetPredicate((widget) {
        return widget is Tab && widget.text == 'Buttons';
      });
      await tester.ensureVisible(finder);
      await tester.tap(finder, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(ButtonsPage), findsOneWidget);
      expect(find.byType(InputsPage), findsNothing);
      expect(find.byType(SelectionsPage), findsNothing);
      expect(find.byType(TextPage), findsNothing);
    },
  );

  testWidgets(
    'should display InputsPage',
    (tester) async {
      await pumpApp(tester);

      final finder = find.byWidgetPredicate((widget) {
        return widget is Tab && widget.text == 'Inputs';
      });
      await tester.ensureVisible(finder);
      await tester.tap(finder, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(InputsPage), findsOneWidget);
      expect(find.byType(ButtonsPage), findsNothing);
      expect(find.byType(SelectionsPage), findsNothing);
      expect(find.byType(TextPage), findsNothing);
    },
  );

  testWidgets(
    'should display SelectionsPage',
    (tester) async {
      await pumpApp(tester);

      final finder = find.byWidgetPredicate((widget) {
        return widget is Tab && widget.text == 'Selections';
      });
      await tester.ensureVisible(finder);
      await tester.tap(finder, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(SelectionsPage), findsOneWidget);
      expect(find.byType(ButtonsPage), findsNothing);
      expect(find.byType(InputsPage), findsNothing);
      expect(find.byType(TextPage), findsNothing);
    },
  );

  testWidgets(
    'should display TextPage',
    (tester) async {
      await pumpApp(tester);

      final finder = find.byWidgetPredicate((widget) {
        return widget is Tab && widget.text == 'Text';
      });
      await tester.ensureVisible(finder);
      await tester.tap(finder, warnIfMissed: false);
      await tester.pumpAndSettle();

      expect(find.byType(TextPage), findsOneWidget);
      expect(find.byType(InputsPage), findsNothing);
      expect(find.byType(ButtonsPage), findsNothing);
      expect(find.byType(SelectionsPage), findsNothing);
    },
  );
}
