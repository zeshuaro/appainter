import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:flutter_theme/basic_theme/views/basic_editor.dart';
import 'package:mocktail/mocktail.dart';

import '../../brightness.dart';
import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

class MockBasicThemeCubit extends MockCubit<BasicThemeState>
    implements BasicThemeCubit {}

class FakeBasicThemeState extends Fake implements BasicThemeState {}

void main() {
  final widgetTesters = WidgetTesters(expandText: 'More Colors');
  late BasicThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<BasicThemeState>(FakeBasicThemeState());
  });

  setUp(() {
    cubit = MockBasicThemeCubit();
    when(() => cubit.state).thenReturn(BasicThemeState());
  });

  testWidgets('displays BasicEditor', (tester) async {
    await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);
    expect(find.byType(BasicEditor), findsOneWidget);
  });

  group('primary color picker', () {
    final key = 'basicEditor_primaryColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(primary: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.primaryColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          // Given
          final colorScheme = ColorScheme.light(onPrimary: test.color);

          // When
          await _pumpApp(tester, cubit, colorScheme);

          // Then
          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(() {
            cubit.primaryColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });

  group('primary color dark picker', () {
    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(primaryVariant: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

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

  group('accent color picker', () {
    final key = 'basicEditor_accentColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(secondary: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.accentColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          // Given
          final colorScheme = ColorScheme.light(onSecondary: test.color);

          // When
          await _pumpApp(tester, cubit, colorScheme);

          // Then
          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(() {
            cubit.accentColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });

  group('accent color dark picker', () {
    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(secondaryVariant: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(
          tester,
          'basicEditor_accentColorDarkPicker',
          color,
        );
        verify(() => cubit.accentColorDarkChanged(color)).called(1);
      },
    );
  });

  group('surface color picker', () {
    final key = 'basicEditor_surfaceColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(surface: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.surfaceColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          // Given
          final colorScheme = ColorScheme.light(onSurface: test.color);

          // When
          await _pumpApp(tester, cubit, colorScheme);

          // Then
          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(() {
            cubit.surfaceColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });

  group('background color picker', () {
    final key = 'basicEditor_backgroundColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(background: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.bgColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          // Given
          final colorScheme = ColorScheme.light(onBackground: test.color);

          // When
          await _pumpApp(tester, cubit, colorScheme);

          // Then
          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(() {
            cubit.bgColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });

  group('error color picker', () {
    final key = 'basicEditor_errorColorPicker';

    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        // Given
        final color = getRandomColor();
        final colorScheme = ColorScheme.light(error: color);

        // When
        await _pumpApp(tester, cubit, colorScheme);

        // Then
        await widgetTesters.checkColorPicker(tester, key, color);
        verify(() => cubit.errorColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          // Given
          final colorScheme = ColorScheme.light(onError: test.color);

          // When
          await _pumpApp(tester, cubit, colorScheme);

          // Then
          await widgetTesters.checkSwitch(tester, key, test.isDark);
          verify(() {
            cubit.errorColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });
}

Future<void> _pumpApp(
  WidgetTester tester,
  BasicThemeCubit cubit,
  ColorScheme colorScheme,
) async {
  whenListen(
    cubit,
    Stream.fromIterable([
      BasicThemeState(),
      BasicThemeState(colorScheme: colorScheme),
    ]),
  );

  await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);
}
