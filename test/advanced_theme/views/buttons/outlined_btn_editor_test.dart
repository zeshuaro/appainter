import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Outlined Button');
  late AdvancedThemeCubit cubit;
  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(OutlinedBtnEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('displays OutlinedBtnEditor', (tester) async {
    await tester.pumpApp(OutlinedBtnEditor(), advancedThemeCubit: cubit);
    expect(find.byType(OutlinedBtnEditor), findsOneWidget);
  });

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final style = OutlinedButton.styleFrom(backgroundColor: color);
      final state = AdvancedThemeState(
        themeData: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(tester, 'bgColorPicker', color);
    },
  );

  testWidgets(
    'foregound color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final style = OutlinedButton.styleFrom(
        primary: color,
        onSurface: ColorScheme.light().onSurface,
      );
      final state = AdvancedThemeState(
        themeData: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(tester, 'fgColorPicker', color);
    },
  );

  testWidgets(
    'overlay color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final style = OutlinedButton.styleFrom(primary: color);
      final state = AdvancedThemeState(
        themeData: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(
        tester,
        'overlayColorPicker',
        color,
        expectedColor: color.withOpacity(0.12),
      );
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final style = OutlinedButton.styleFrom(shadowColor: color);
      final state = AdvancedThemeState(
        themeData: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkColorPicker(tester, 'shadowColorPicker', color);
    },
  );

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final style = ElevatedButton.styleFrom(elevation: value);
      final state = AdvancedThemeState(
        themeData: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(style: style),
        ),
      );

      await _pumpApp(tester, state);

      await _widgetTesters.checkTextField(tester, 'elevationTextField', value);
    },
  );
}
