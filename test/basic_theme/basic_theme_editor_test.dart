import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:flutter_theme/basic_theme/views/basic_editor.dart';
import 'package:mocktail/mocktail.dart';

import '../brightness.dart';
import '../mocks.dart';
import '../pump_app.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters();

  late BasicThemeCubit cubit;
  late Color color;

  setUp(() {
    cubit = MockBasicThemeCubit();
    color = getRandomColor();
  });

  Future<void> _pumpApp(WidgetTester tester, ColorScheme colorScheme) async {
    whenListen(
      cubit,
      Stream.fromIterable([BasicThemeState(colorScheme: colorScheme)]),
      initialState: const BasicThemeState(),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: const MaterialApp(
          home: BasicEditor(),
        ),
      ),
    );

    await tester.pumpApp(const BasicEditor(), basicThemeCubit: cubit);
  }

  group('test primary color', () {
    const key = 'basicEditor_primaryColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        color = const Color(0xFFF44336);
        final colorScheme = ColorScheme.light(primary: color);

        await _pumpApp(tester, colorScheme);

        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.primaryColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          final colorScheme = ColorScheme.light(onPrimary: test.color);

          await _pumpApp(tester, colorScheme);

          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(
            () => cubit.primaryColorBrightnessChanged(!test.isDark),
          ).called(1);
        },
      );
    }
  });

  group('test primary color dark', () {
    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        final colorScheme = ColorScheme.light(primaryVariant: color);

        // When
        await _pumpApp(tester, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(
          tester,
          'basicEditor_primaryColorDarkPicker',
          color,
        );
        verify(() => cubit.primaryColorDarkChanged(color)).called(1);
      },
    );
  });

  group('test secondary color', () {
    const key = 'basicEditor_secondaryColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        final colorScheme = ColorScheme.light(secondary: color);

        await _pumpApp(tester, colorScheme);

        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.secondaryColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          final colorScheme = ColorScheme.light(onSecondary: test.color);

          await _pumpApp(tester, colorScheme);

          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(
            () => cubit.secondaryColorBrightnessChanged(!test.isDark),
          ).called(1);
        },
      );
    }
  });

  group('test secondary color dark', () {
    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        final colorScheme = ColorScheme.light(secondaryVariant: color);

        await _pumpApp(tester, colorScheme);

        await widgetTesters.checkColorPicker(
          tester,
          'basicEditor_secondaryColorDarkPicker',
          color,
        );
        verify(() => cubit.secondaryColorDarkChanged(color)).called(1);
      },
    );
  });

  group('test surface color', () {
    const key = 'basicEditor_surfaceColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        final colorScheme = ColorScheme.light(surface: color);

        await _pumpApp(tester, colorScheme);

        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.surfaceColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          final colorScheme = ColorScheme.light(onSurface: test.color);

          await _pumpApp(tester, colorScheme);

          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(
            () => cubit.surfaceColorBrightnessChanged(!test.isDark),
          ).called(1);
        },
      );
    }
  });

  group('test background color', () {
    const key = 'basicEditor_backgroundColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        final colorScheme = ColorScheme.light(background: color);

        await _pumpApp(tester, colorScheme);

        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.backgroundColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          final colorScheme = ColorScheme.light(onBackground: test.color);

          await _pumpApp(tester, colorScheme);

          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(
            () => cubit.backgroundColorBrightnessChanged(!test.isDark),
          ).called(1);
        },
      );
    }
  });

  group('test error color', () {
    const key = 'basicEditor_errorColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        final colorScheme = ColorScheme.light(error: color);

        await _pumpApp(tester, colorScheme);

        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.errorColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          final colorScheme = ColorScheme.light(onError: test.color);

          await _pumpApp(tester, colorScheme);

          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(
            () => cubit.errorColorBrightnessChanged(!test.isDark),
          ).called(1);
        },
      );
    }
  });
}
