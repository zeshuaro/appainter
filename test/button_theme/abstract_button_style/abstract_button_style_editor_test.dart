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
    when(() => buttonStyleCubit.defaultShape).thenReturn(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );

    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
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
        final prop = getMaterialStateProperty({WidgetState.disabled: color});
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
        final prop = getMaterialStateProperty({WidgetState.hovered: color});
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
        final prop = getMaterialStateProperty({WidgetState.focused: color});
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
        final prop = getMaterialStateProperty({WidgetState.pressed: color});
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

  group('shape dropdown', () {
    const key = 'abstractButtonStyleEditor_shapeDropdown';
    final outlinedBorderEnum = OutlinedBorderEnum();

    for (var border in outlinedBorderEnum.values) {
      final borderStr = outlinedBorderEnum.convertToString(border)!;

      testWidgets('render ${border.runtimeType}', (tester) async {
        final prop = getMaterialStateProperty({null: border});
        final state = ButtonStyleState.withStyle(shape: prop);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, borderStr);
      });

      testWidgets('change ${border.runtimeType}', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          borderStr,
          buttonStyleCubit.shapeChanged,
        );
      });
    }
  });

  group('shape border radius text field', () {
    const key = 'abstractButtonStyleEditor_shapeBorderRadiusTextField';

    testWidgets('render widget', (tester) async {
      final border = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(doubleNum),
      );
      final prop = getMaterialStateProperty({null: border});
      final state = ButtonStyleState.withStyle(shape: prop);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        buttonStyleCubit.shapeBorderRadiusChanged,
      );
    });
  });
}
