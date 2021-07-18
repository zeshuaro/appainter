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

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
  }

  testWidgets(
    'color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(color: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_colorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(shadowColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'appbarEditor_shadowColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  for (var test in BrightnessTest.testCases) {
    testWidgets(
      'brightness should be toggled to ${test.isDark}',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            appBarTheme: AppBarTheme(brightness: test.brightness),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'appbarEditor_brightnessSwitch',
          test.isDark,
        );
        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            appBarTheme: AppBarTheme(brightness: test.brightnessComplement),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  for (var isCenter in [true, false]) {
    testWidgets(
      'center title should be toggled to $isCenter',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            appBarTheme: AppBarTheme(centerTitle: isCenter),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'appbarEditor_centerTitleSwitch',
          isCenter,
        );

        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            appBarTheme: AppBarTheme(centerTitle: !isCenter),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(elevation: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_elevationTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'title spacing should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          appBarTheme: AppBarTheme(titleSpacing: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'appbarEditor_titleSpacingTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
