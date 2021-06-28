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

class FakeColor extends Fake implements Color {}

void main() {
  late BasicThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<BasicThemeState>(FakeBasicThemeState());
    registerFallbackValue<Color>(FakeColor());
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(colorScheme: ColorScheme.light(primary: color)),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(tester, key, color);
        verify(() => cubit.primaryColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          when(() => cubit.state).thenReturn(
            BasicThemeState(
              colorScheme: ColorScheme.light(onPrimary: test.color),
            ),
          );

          await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

          await checkBrightnessSwitch(tester, key, test.isDark);
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(
            colorScheme: ColorScheme.light(primaryVariant: color),
          ),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(
          tester,
          'basicEditor_primaryColorDarkPicker',
          color,
          expandText: 'More Colors',
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(colorScheme: ColorScheme.light(secondary: color)),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(tester, key, color, expandText: 'More Colors');
        verify(() => cubit.accentColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          when(() => cubit.state).thenReturn(
            BasicThemeState(
              colorScheme: ColorScheme.light(onSecondary: test.color),
            ),
          );

          await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

          await checkBrightnessSwitch(
            tester,
            key,
            test.isDark,
            expandText: 'More Colors',
          );
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(
            colorScheme: ColorScheme.light(secondaryVariant: color),
          ),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(
          tester,
          'basicEditor_accentColorDarkPicker',
          color,
          expandText: 'More Colors',
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(colorScheme: ColorScheme.light(surface: color)),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(tester, key, color, expandText: 'More Colors');
        verify(() => cubit.surfaceColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          when(() => cubit.state).thenReturn(
            BasicThemeState(
              colorScheme: ColorScheme.light(onSurface: test.color),
            ),
          );

          await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

          await checkBrightnessSwitch(
            tester,
            key,
            test.isDark,
            expandText: 'More Colors',
          );
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(colorScheme: ColorScheme.light(background: color)),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(tester, key, color, expandText: 'More Colors');
        verify(() => cubit.bgColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          when(() => cubit.state).thenReturn(
            BasicThemeState(
              colorScheme: ColorScheme.light(onBackground: test.color),
            ),
          );

          await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

          await checkBrightnessSwitch(
            tester,
            key,
            test.isDark,
            expandText: 'More Colors',
          );
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
        final color = getRandomColor();
        when(() => cubit.state).thenReturn(
          BasicThemeState(colorScheme: ColorScheme.light(error: color)),
        );

        await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);

        await checkColorPicker(tester, key, color, expandText: 'More Colors');
        verify(() => cubit.errorColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled with ${test.isDark}',
        (tester) async {
          when(() => cubit.state).thenReturn(
            BasicThemeState(
              colorScheme: ColorScheme.light(onError: test.color),
            ),
          );

          await tester.pumpApp(BasicEditor(), basicThemeCubit: cubit);
          await checkBrightnessSwitch(
            tester,
            key,
            test.isDark,
            expandText: 'More Colors',
          );
          verify(() {
            cubit.errorColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });
}
