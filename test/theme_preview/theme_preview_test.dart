import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/cubit/app_bar_theme_cubit.dart';
import 'package:flutter_theme/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/theme_preview/theme_preview.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../pump_app.dart';

void main() {
  late HomeCubit homeCubit;
  late BasicThemeCubit basicThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;
  late AppBarThemeCubit appBarThemeCubit;
  late TabBarThemeCubit tabBarThemeCubit;
  late BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit;

  setUpAll(() {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeBasicThemeState());
    registerFallbackValue(FakeAdvancedThemeState());
    registerFallbackValue(FakeAppBarThemeState());
    registerFallbackValue(FakeTabBarThemeState());
    registerFallbackValue(FakeBottomNavigationBarThemeState());
    registerFallbackValue(FakeThemeData());
  });

  setUp(() {
    homeCubit = MockHomeCubit();
    basicThemeCubit = MockBasicThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();
    appBarThemeCubit = MockAppBarThemeCubit();
    tabBarThemeCubit = MockTabBarThemeCubit();
    bottomNavigationBarThemeCubit = MockBottomNavigationBarThemeCubit();

    when(() => homeCubit.state).thenReturn(const HomeState());
    when(() => homeCubit.themeUsageFetched()).thenAnswer((_) async => {});
    when(() => basicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => advancedThemeCubit.state).thenReturn(AdvancedThemeState());
    when(() => appBarThemeCubit.state).thenReturn(const AppBarThemeState());
    when(() => tabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() {
      return bottomNavigationBarThemeCubit.state;
    }).thenReturn(const BottomNavigationBarThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester) async {
    await tester.pumpApp(
      const ThemePreview(),
      homeCubit: homeCubit,
      basicThemeCubit: basicThemeCubit,
      advancedThemeCubit: advancedThemeCubit,
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
    );
  }

  testWidgets('should display ThemePreview', (tester) async {
    await _pumpApp(tester);
    expect(find.byType(ThemePreview), findsOneWidget);
  });

  testWidgets(
    'should display ButtonsPage',
    (tester) async {
      await _pumpApp(tester);

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
      await _pumpApp(tester);

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
      await _pumpApp(tester);

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
      await _pumpApp(tester);

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
