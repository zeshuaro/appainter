import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/text_button_theme/text_button_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

Future<void> main() async {
  const expandText = 'Text button';
  const textButtonThemeState = TextButtonThemeState();

  late TextButtonThemeCubit textButtonThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    textButtonThemeCubit = MockTextButtonThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    TextButtonThemeState? state,
  ]) async {
    when(() => textButtonThemeCubit.state).thenReturn(
      state ?? textButtonThemeState,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: textButtonThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const TextButtonThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  group('background color picker', () {
    const key = 'textButtonThemeEditor_backgroundColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = TextButtonThemeState.withTheme(backgroundColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        textButtonThemeCubit.backgroundColorChanged,
      );
    });
  });

  group('foreground color pickers', () {
    group('default', () {
      const key = 'textButtonThemeEditor_foregroundColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = TextButtonThemeState.withTheme(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          textButtonThemeCubit.foregroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'textButtonThemeEditor_foregroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = TextButtonThemeState.withTheme(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.38);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          textButtonThemeCubit.foregroundDisabledColorChanged,
        );
      });
    });
  });

  group('overlay color pickers', () {
    group('hovered', () {
      const key = 'textButtonThemeEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = TextButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.04);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          textButtonThemeCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused', () {
      const key = 'textButtonThemeEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = TextButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          textButtonThemeCubit.overlayFocusedColorChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'textButtonThemeEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = TextButtonThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          textButtonThemeCubit.overlayPressedColorChanged,
        );
      });
    });
  });

  group('shadow color picker', () {
    const key = 'textButtonThemeEditor_shadowColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = TextButtonThemeState.withTheme(shadowColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        textButtonThemeCubit.shadowColorChanged,
      );
    });
  });

  group('elevation text field', () {
    const key = 'textButtonThemeEditor_elevationTextField_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: doubleNum});
      final state = TextButtonThemeState.withTheme(elevation: prop);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        textButtonThemeCubit.elevationChanged,
      );
    });
  });
}
