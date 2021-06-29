import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../brightness.dart';
import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  final widgetTesters = WidgetTesters(expandText: 'App Bar');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('displays AppBarEditor', (tester) async {
    await tester.pumpApp(AppBarEditor(), advancedThemeCubit: cubit);
    expect(find.byType(AppBarEditor), findsOneWidget);
  });

  testWidgets(
    'color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final appBarTheme = AppBarTheme(color: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(appBarTheme: appBarTheme)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_colorPicker',
        color,
      );
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final appBarTheme = AppBarTheme(shadowColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(appBarTheme: appBarTheme)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_shadowColorPicker',
        color,
      );
    },
  );

  for (var test in BrightnessTest.testCases) {
    testWidgets(
      'brightness should be toggled to ${test.isDark}',
      (tester) async {
        final appBarTheme = AppBarTheme(brightness: test.brightness);
        when(() => cubit.state).thenReturn(
          AdvancedThemeState(themeData: ThemeData(appBarTheme: appBarTheme)),
        );

        await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
        await widgetTesters.checkSwitch(
          tester,
          'appbarEditor_brightnessSwitch',
          test.isDark,
        );
      },
    );
  }

  for (var isCenter in [true, false]) {
    testWidgets(
      'center title should be toggled to $isCenter',
      (tester) async {
        final appBarTheme = AppBarTheme(centerTitle: isCenter);
        when(() => cubit.state).thenReturn(
          AdvancedThemeState(themeData: ThemeData(appBarTheme: appBarTheme)),
        );

        await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
        await widgetTesters.checkSwitch(
          tester,
          'appbarEditor_centerTitleSwitch',
          isCenter,
        );
      },
    );
  }

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final appBarTheme = AppBarTheme(elevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(appBarTheme: appBarTheme)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_elevationTextField',
        value,
      );
    },
  );

  testWidgets(
    'title spacing should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final appBarTheme = AppBarTheme(titleSpacing: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(appBarTheme: appBarTheme)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_titleSpacingTextField',
        value,
      );
    },
  );
}
