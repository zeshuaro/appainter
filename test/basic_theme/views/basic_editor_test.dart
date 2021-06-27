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

        final captured = verify(() {
          cubit.primaryColorChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

          final captured = verify(() {
            cubit.primaryColorBrightnessChanged(captureAny());
          }).captured;
          expect(captured.last, equals(!test.isDark));
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

        final captured = verify(() {
          cubit.primaryColorDarkChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

        final captured = verify(() {
          cubit.accentColorChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

          final captured = verify(() {
            cubit.accentColorBrightnessChanged(captureAny());
          }).captured;
          expect(captured.last, equals(!test.isDark));
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

        final captured = verify(() {
          cubit.accentColorDarkChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

        final captured = verify(() {
          cubit.surfaceColorChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

          final captured = verify(() {
            cubit.surfaceColorBrightnessChanged(captureAny());
          }).captured;
          expect(captured.last, equals(!test.isDark));
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

        final captured = verify(() {
          cubit.bgColorChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

          final captured = verify(() {
            cubit.bgColorBrightnessChanged(captureAny());
          }).captured;
          expect(captured.last, equals(!test.isDark));
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

        final captured = verify(() {
          cubit.errorColorChanged(captureAny());
        }).captured;
        expect(captured.last, equals(color));
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

          final captured = verify(() {
            cubit.errorColorBrightnessChanged(captureAny());
          }).captured;
          expect(captured.last, equals(!test.isDark));
        },
      );
    }
  });
}
