import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/outlined_button_theme/outlined_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

Future<void> main() async {
  const expandText = 'Outlined button';
  const outlinedButtonThemeState = OutlinedButtonThemeState();

  late OutlinedButtonThemeCubit outlinedButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    outlinedButtonThemeCubit = MockOutlinedButtonThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    OutlinedButtonThemeState? state,
  ]) async {
    when(() => outlinedButtonThemeCubit.state).thenReturn(
      state ?? outlinedButtonThemeState,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: outlinedButtonThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const OutlinedButtonThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  group('background color picker', () {
    const key = 'outlinedButtonThemeEditor_backgroundColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = OutlinedButtonThemeState.withTheme(backgroundColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        outlinedButtonThemeCubit.backgroundColorChanged,
      );
    });
  });

  group('foreground color pickers', () {
    group('default', () {
      const key = 'outlinedButtonThemeEditor_foregroundColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = OutlinedButtonThemeState.withTheme(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          outlinedButtonThemeCubit.foregroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'outlinedButtonThemeEditor_foregroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = OutlinedButtonThemeState.withTheme(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.38);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          outlinedButtonThemeCubit.foregroundDisabledColorChanged,
        );
      });
    });
  });

  group('overlay color pickers', () {
    group('hovered', () {
      const key = 'outlinedButtonThemeEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = OutlinedButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.04);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          outlinedButtonThemeCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused', () {
      const key = 'outlinedButtonThemeEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = OutlinedButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          outlinedButtonThemeCubit.overlayFocusedColorChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'outlinedButtonThemeEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = OutlinedButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          outlinedButtonThemeCubit.overlayPressedColorChanged,
        );
      });
    });
  });

  group('shadow color picker', () {
    const key = 'outlinedButtonThemeEditor_shadowColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = OutlinedButtonThemeState.withTheme(shadowColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        outlinedButtonThemeCubit.shadowColorChanged,
      );
    });
  });

  group('elevation text field', () {
    const key = 'outlinedButtonThemeEditor_elevationTextField_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: doubleNum});
      final state = OutlinedButtonThemeState.withTheme(elevation: prop);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        outlinedButtonThemeCubit.elevationChanged,
      );
    });
  });
}
