import 'dart:math';

import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../utils.dart';
import '../../utils/widget_tester_utils.dart';

Future<void> main() async {
  const expandText = 'Elevated button';
  final colorScheme = ThemeData().colorScheme;

  late ElevatedButtonThemeCubit elevatedButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  late ElevatedButtonThemeEditor sut;

  setUp(() {
    elevatedButtonThemeCubit = MockElevatedButtonThemeCubit();
    when(() => elevatedButtonThemeCubit.defaultShape).thenReturn(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    sut = const ElevatedButtonThemeEditor();
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    ButtonStyleState? state,
  ]) async {
    when(() => elevatedButtonThemeCubit.state).thenReturn(
      state ?? const ButtonStyleState(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: elevatedButtonThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const ElevatedButtonThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  test('fallback foreground default color', () {
    final actual = sut.fallbackForegroundDefaultColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary));
  });

  test('fallback foreground disabled color', () {
    final actual = sut.fallbackForegroundDisabledColor(colorScheme);
    expect(actual, equals(colorScheme.onSurface.withOpacity(0.38)));
  });

  test('fallback overlay focused color', () {
    final actual = sut.fallbackOverlayFocusedColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary.withOpacity(0.24)));
  });

  test('fallback overlay hovered color', () {
    final actual = sut.fallbackOverlayHoveredColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary.withOpacity(0.08)));
  });

  test('fallback overlay pressed color', () {
    final actual = sut.fallbackOverlayPressedColor(colorScheme);
    expect(actual, equals(colorScheme.onPrimary.withOpacity(0.24)));
  });

  test('header', () => expect(sut.header, equals('Elevated button')));

  group('background color pickers', () {
    group('default', () {
      const key = 'elevatedButtonThemeEditor_backgroundColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ButtonStyleState.withStyle(backgroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          elevatedButtonThemeCubit.backgroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'elevatedButtonThemeEditor_backgroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.disabled: color});
        final state = ButtonStyleState.withStyle(backgroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          elevatedButtonThemeCubit.backgroundDisabledColorChanged,
        );
      });
    });
  });

  group('elevation text fields', () {
    group('default', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: doubleNum});
        final state = ButtonStyleState.withStyle(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          elevatedButtonThemeCubit.defaultElevationChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          WidgetState.disabled: doubleNum,
        });
        final state = ButtonStyleState.withStyle(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          elevatedButtonThemeCubit.disabledElevationChanged,
        );
      });
    });

    group('hovered', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          WidgetState.hovered: doubleNum,
        });
        final state = ButtonStyleState.withStyle(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          elevatedButtonThemeCubit.hoveredElevationChanged,
        );
      });
    });

    group('focused', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          WidgetState.focused: doubleNum,
        });
        final state = ButtonStyleState.withStyle(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          elevatedButtonThemeCubit.focusedElevationChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          WidgetState.pressed: doubleNum,
        });
        final state = ButtonStyleState.withStyle(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          elevatedButtonThemeCubit.pressedElevationChanged,
        );
      });
    });
  });
}
