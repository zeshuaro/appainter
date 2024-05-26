import 'dart:math';

import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
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
  const expandText = 'Checkbox';
  const checkboxThemeState = CheckboxThemeState();

  late CheckboxThemeCubit checkboxThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    checkboxThemeCubit = MockCheckboxThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, [CheckboxThemeState? state]) async {
    when(() => checkboxThemeCubit.state).thenReturn(
      state ?? checkboxThemeState,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: checkboxThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const CheckboxThemeEditor(),
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
    CheckboxThemeState state,
  ) {
    tester.expectBlocBuilder<CheckboxThemeCubit, CheckboxThemeState>(
      key,
      checkboxThemeState,
      state,
    );
  }

  group('fill colors', () {
    group('default color picker', () {
      const key = 'checkboxThemeEditor_fillColor_default';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({null: color});
        final state = CheckboxThemeState.withTheme(fillColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.54);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          checkboxThemeCubit.fillDefaultColorChanged,
        );
      });
    });

    group('selected color picker', () {
      const key = 'checkboxThemeEditor_fillColor_selected';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.selected: color});
        final state = CheckboxThemeState.withTheme(fillColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          checkboxThemeCubit.fillSelectedColorChanged,
        );
      });
    });

    group('disabled color picker', () {
      const key = 'checkboxThemeEditor_fillColor_disabled';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.disabled: color});
        final state = CheckboxThemeState.withTheme(fillColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.38);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          checkboxThemeCubit.fillDisabledColorChanged,
        );
      });
    });
  });

  group('check color picker', () {
    const key = 'checkboxThemeEditor_checkColor_default';

    testWidgets('render widget', (tester) async {
      final prop = getMaterialStateProperty({null: color});
      final state = CheckboxThemeState.withTheme(checkColor: prop);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        checkboxThemeCubit.checkColorChanged,
      );
    });
  });

  group('overlay colors', () {
    group('pressed color picker', () {
      const key = 'checkboxThemeEditor_overlayColor_pressed';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.pressed: color});
        final state = CheckboxThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          checkboxThemeCubit.overlayPressedColorChanged,
        );
      });
    });

    group('hovered color picker', () {
      const key = 'checkboxThemeEditor_overlayColor_hovered';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.hovered: color});
        final state = CheckboxThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.04);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          checkboxThemeCubit.overlayHoveredColorChanged,
        );
      });
    });

    group('focused color picker', () {
      const key = 'checkboxThemeEditor_overlayColor_focused';

      testWidgets('render widget', (tester) async {
        final prop = getMaterialStateProperty({WidgetState.focused: color});
        final state = CheckboxThemeState.withTheme(overlayColor: prop);

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.12);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          checkboxThemeCubit.overlayFocusedColorChanged,
        );
      });
    });
  });

  group('splash radius text field', () {
    const key = 'checkboxThemeEditor_splashRadiusTextField';

    testWidgets('render widget', (tester) async {
      final state = CheckboxThemeState.withTheme(splashRadius: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change text', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        checkboxThemeCubit.splashRadiusChanged,
      );
    });
  });

  group('material tap target size dropdown', () {
    const key = 'checkboxThemeEditor_materialTapTargetSizeDropdown';

    for (var size in MaterialTapTargetSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets('render $size', (tester) async {
        final state = CheckboxThemeState.withTheme(materialTapTargetSize: size);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, sizeStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $size', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          sizeStr,
          checkboxThemeCubit.materialTapTargetSize,
        );
      });
    }
  });
}
