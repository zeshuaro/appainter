import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/elevated_button_theme/elevated_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

Future<void> main() async {
  const expandText = 'Elevated button';
  const btnState = ElevatedButtonThemeState();

  late ElevatedButtonThemeCubit btnCubit;
  late ColorThemeCubit colorCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    btnCubit = MockElevatedButtonThemeCubit();
    colorCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    ElevatedButtonThemeState? state,
  ]) async {
    when(() => btnCubit.state).thenReturn(state ?? btnState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: btnCubit),
            BlocProvider.value(value: colorCubit),
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

  group('background color pickers', () {
    group('default', () {
      const key = 'elevatedButtonThemeEditor_backgroundColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ElevatedButtonThemeState.withTheme(backgroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          btnCubit.backgroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'elevatedButtonThemeEditor_backgroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = ElevatedButtonThemeState.withTheme(backgroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          btnCubit.backgroundDisabledColorChanged,
        );
      });
    });
  });

  group('foreground color pickers', () {
    group('default', () {
      const key = 'elevatedButtonThemeEditor_foregroundColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ElevatedButtonThemeState.withTheme(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          btnCubit.foregroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'elevatedButtonThemeEditor_foregroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = ElevatedButtonThemeState.withTheme(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.38);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          btnCubit.foregroundDisabledColorChanged,
        );
      });
    });
  });

  group('overlay color pickers', () {
    group('hovered', () {
      const key = 'elevatedButtonThemeEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = ElevatedButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.08);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          btnCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused', () {
      const key = 'elevatedButtonThemeEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = ElevatedButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.24);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          btnCubit.overlayFocusedColorChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'elevatedButtonThemeEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = ElevatedButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.24);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          btnCubit.overlayPressedColorChanged,
        );
      });
    });
  });

  group('shadow color picker', () {
    const key = 'elevatedButtonThemeEditor_shadowColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = ElevatedButtonThemeState.withTheme(shadowColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        btnCubit.shadowColorChanged,
      );
    });
  });

  group('elevation text fields', () {
    group('default', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: doubleNum});
        final state = ElevatedButtonThemeState.withTheme(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          btnCubit.defaultElevationChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: doubleNum,
        });
        final state = ElevatedButtonThemeState.withTheme(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          btnCubit.disabledElevationChanged,
        );
      });
    });

    group('hovered', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: doubleNum,
        });
        final state = ElevatedButtonThemeState.withTheme(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          btnCubit.hoveredElevationChanged,
        );
      });
    });

    group('focused', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: doubleNum,
        });
        final state = ElevatedButtonThemeState.withTheme(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          btnCubit.focusedElevationChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'elevatedButtonThemeEditor_elevationTextField_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: doubleNum,
        });
        final state = ElevatedButtonThemeState.withTheme(elevation: prop);

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          btnCubit.pressedElevationChanged,
        );
      });
    });
  });
}
