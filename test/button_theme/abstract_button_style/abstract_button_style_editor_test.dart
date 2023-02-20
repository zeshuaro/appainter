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
import 'mocks.dart';

Future<void> main() async {
  const expandText = 'Test';
  const buttonStyleState = ButtonStyleState();

  late TestButtonStyleCubit buttonStyleCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    buttonStyleCubit = MockButtonStyleCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    ButtonStyleState? state,
  ]) async {
    when(() => buttonStyleCubit.state).thenReturn(state ?? buttonStyleState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: buttonStyleCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const TestButtonStyleEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  group('background color pickers', () {
    group('default', () {
      const key = 'abstractButtonStyleEditor_backgroundColor_default';

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
          buttonStyleCubit.backgroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'abstractButtonStyleEditor_backgroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = ButtonStyleState.withStyle(backgroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          buttonStyleCubit.backgroundDisabledColorChanged,
        );
      });
    });
  });

  group('foreground color pickers', () {
    group('default', () {
      const key = 'abstractButtonStyleEditor_foregroundColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = ButtonStyleState.withStyle(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          buttonStyleCubit.foregroundDefaultColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'abstractButtonStyleEditor_foregroundColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.disabled: color});
        final state = ButtonStyleState.withStyle(foregroundColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          buttonStyleCubit.foregroundDisabledColorChanged,
        );
      });
    });
  });

  group('overlay color pickers', () {
    group('hovered', () {
      const key = 'abstractButtonStyleEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.hovered: color});
        final state = ButtonStyleState.withStyle(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          buttonStyleCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused', () {
      const key = 'abstractButtonStyleEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.focused: color});
        final state = ButtonStyleState.withStyle(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          buttonStyleCubit.overlayFocusedColorChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'abstractButtonStyleEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({MaterialState.pressed: color});
        final state = ButtonStyleState.withStyle(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          buttonStyleCubit.overlayPressedColorChanged,
        );
      });
    });
  });

  group('shadow color picker', () {
    const key = 'abstractButtonStyleEditor_shadowColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = ButtonStyleState.withStyle(shadowColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        buttonStyleCubit.shadowColorChanged,
      );
    });
  });

  group('elevation text fields', () {
    group('default', () {
      const key = 'abstractButtonStyleEditor_elevationTextField_default';

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
          buttonStyleCubit.defaultElevationChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'abstractButtonStyleEditor_elevationTextField_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.disabled: doubleNum,
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
          buttonStyleCubit.disabledElevationChanged,
        );
      });
    });

    group('hovered', () {
      const key = 'abstractButtonStyleEditor_elevationTextField_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.hovered: doubleNum,
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
          buttonStyleCubit.hoveredElevationChanged,
        );
      });
    });

    group('focused', () {
      const key = 'abstractButtonStyleEditor_elevationTextField_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.focused: doubleNum,
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
          buttonStyleCubit.focusedElevationChanged,
        );
      });
    });

    group('pressed', () {
      const key = 'abstractButtonStyleEditor_elevationTextField_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({
          MaterialState.pressed: doubleNum,
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
          buttonStyleCubit.pressedElevationChanged,
        );
      });
    });
  });
}
