import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'Radio';
  const radioThemeState = RadioThemeState();

  late RadioThemeCubit radioThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    radioThemeCubit = MockRadioThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, [RadioThemeState? state]) async {
    when(() => radioThemeCubit.state).thenReturn(state ?? radioThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: radioThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const RadioThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  void expectBlocBuilder(
    WidgetTester tester,
    String key,
    RadioThemeState state,
  ) {
    tester.expectBlocBuilder<RadioThemeCubit, RadioThemeState>(
      key,
      radioThemeState,
      state,
    );
  }

  group('fill color pickers', () {
    group('default', () {
      const key = 'radioThemeEditor_fillColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = RadioThemeState.withTheme(fillColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.54);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          radioThemeCubit.fillDefaultColorChanged,
        );
      });
    });

    group('selected', () {
      const key = 'radioThemeEditor_fillColor_selected';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.selected: color});
        final state = RadioThemeState.withTheme(fillColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          radioThemeCubit.fillSelectedColorChanged,
        );
      });
    });

    group('disabled', () {
      const key = 'radioThemeEditor_fillColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.disabled: color});
        final state = RadioThemeState.withTheme(fillColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.38);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          radioThemeCubit.fillDisabledColorChanged,
        );
      });
    });
  });

  group('overlay color pickers', () {
    group('pressed', () {
      const key = 'radioThemeEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.pressed: color});
        final state = RadioThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          radioThemeCubit.overlayPressedColorChanged,
        );
      });
    });

    group('hovered', () {
      const key = 'radioThemeEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.hovered: color});
        final state = RadioThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.04);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          radioThemeCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused', () {
      const key = 'radioThemeEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.focused: color});
        final state = RadioThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          radioThemeCubit.overlayFocusedColorChanged,
        );
      });
    });
  });

  group('splash radius text field', () {
    const key = 'radioThemeEditor_splashRadiusTextField';

    testWidgets('render widget', (tester) async {
      final state = RadioThemeState.withTheme(splashRadius: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change text', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        radioThemeCubit.splashRadiusChanged,
      );
    });
  });

  group('material tap target size dropdown', () {
    const key = 'radioThemeEditor_materialTapTargetSizeDropdown';

    for (var size in MaterialTapTargetSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets('render $size', (tester) async {
        final state = RadioThemeState.withTheme(materialTapTargetSize: size);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, sizeStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $size', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          sizeStr,
          radioThemeCubit.materialTapTargetSize,
        );
      });
    }
  });
}
