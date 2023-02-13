import 'dart:math';

import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
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
  const expandText = 'Input decoration';
  const inputDecorationThemeState = InputDecorationThemeState();

  late InputDecorationThemeCubit inputDecorationThemeCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    inputDecorationThemeCubit = MockInputDecorationThemeCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    InputDecorationThemeState? state,
  ]) async {
    when(
      () => inputDecorationThemeCubit.state,
    ).thenReturn(state ?? inputDecorationThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: inputDecorationThemeCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const InputDecorationThemeEditor(),
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
    InputDecorationThemeState state,
  ) {
    tester.expectBlocBuilder<InputDecorationThemeCubit,
        InputDecorationThemeState>(
      key,
      inputDecorationThemeState,
      state,
    );
  }

  group('fill color picker', () {
    const key = 'inputDecorationThemeEditor_fillColorPicker';

    testWidgets('render widget', (tester) async {
      final state = InputDecorationThemeState.withTheme(fillColor: color);

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.04);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        inputDecorationThemeCubit.fillColorChanged,
      );
    });
  });

  group('hover color picker', () {
    const key = 'inputDecorationThemeEditor_hoverColorPicker';

    testWidgets('render widget', (tester) async {
      final state = InputDecorationThemeState.withTheme(hoverColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.04);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        inputDecorationThemeCubit.hoverColorChanged,
      );
    });
  });

  group('align label with hint switch', () {
    const key = 'inputDecorationThemeEditor_alignLabelWithHintSwitch';

    for (var isAligned in [true, false]) {
      testWidgets('render isAligned=$isAligned', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          alignLabelWithHint: isAligned,
        );

        await pumpApp(tester, state);

        tester.expectSwitch(key, isAligned);
        if (isAligned != inputDecorationThemeState.theme.alignLabelWithHint) {
          expectBlocBuilder(tester, key, state);
        }
      });

      testWidgets('change isAligned=$isAligned', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          alignLabelWithHint: !isAligned,
        );
        await pumpApp(tester, state);
        await tester.verifySwitch(
          key,
          isAligned,
          inputDecorationThemeCubit.alignLabelWithHintChanged,
        );
      });
    }
  });

  group('filled switch', () {
    const key = 'inputDecorationThemeEditor_filledSwitch';

    for (var isFilled in [true, false]) {
      testWidgets('render isFilled=$isFilled', (tester) async {
        final state = InputDecorationThemeState.withTheme(filled: isFilled);

        await pumpApp(tester, state);

        tester.expectSwitch(key, isFilled);
        if (isFilled != inputDecorationThemeState.theme.filled) {
          expectBlocBuilder(tester, key, state);
        }
      });

      testWidgets('change isFilled=$isFilled', (tester) async {
        final state = InputDecorationThemeState.withTheme(filled: !isFilled);
        await pumpApp(tester, state);
        await tester.verifySwitch(
          key,
          isFilled,
          inputDecorationThemeCubit.filledChanged,
        );
      });
    }
  });

  group('is collapsed switch', () {
    const key = 'inputDecorationThemeEditor_isCollapsedSwitch';

    for (var isCollapsed in [true, false]) {
      testWidgets('render isCollapsed=$isCollapsed', (tester) async {
        final state =
            InputDecorationThemeState.withTheme(isCollapsed: isCollapsed);

        await pumpApp(tester, state);

        tester.expectSwitch(key, isCollapsed);
        if (isCollapsed != inputDecorationThemeState.theme.isCollapsed) {
          expectBlocBuilder(tester, key, state);
        }
      });

      testWidgets('change isCollapsed=$isCollapsed', (tester) async {
        final state =
            InputDecorationThemeState.withTheme(isCollapsed: !isCollapsed);
        await pumpApp(tester, state);
        await tester.verifySwitch(
          key,
          isCollapsed,
          inputDecorationThemeCubit.isCollapsedChanged,
        );
      });
    }
  });

  group('is dense switch', () {
    const key = 'inputDecorationThemeEditor_isDenseSwitch';

    for (var isDense in [true, false]) {
      testWidgets('render isDense=$isDense', (tester) async {
        final state = InputDecorationThemeState.withTheme(isDense: isDense);

        await pumpApp(tester, state);

        tester.expectSwitch(key, isDense);
        if (isDense != inputDecorationThemeState.theme.isDense) {
          expectBlocBuilder(tester, key, state);
        }
      });

      testWidgets('change isDense=$isDense', (tester) async {
        final state = InputDecorationThemeState.withTheme(isDense: !isDense);
        await pumpApp(tester, state);
        await tester.verifySwitch(
          key,
          isDense,
          inputDecorationThemeCubit.isDenseChanged,
        );
      });
    }
  });

  group('error max lines text field', () {
    const key = 'inputDecorationThemeEditor_errorMaxLinesTextField';
    const valInt = kInputDecorationThemeErrorMaxLines + 1;
    final valStr = valInt.toString();

    testWidgets('render widget', (tester) async {
      final state = InputDecorationThemeState.withTheme(errorMaxLines: valInt);

      await pumpApp(tester, state);

      await tester.expectTextField(key, valStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        valStr,
        inputDecorationThemeCubit.errorMaxLinesChanged,
      );
    });
  });

  group('helper max lines text field', () {
    const key = 'inputDecorationThemeEditor_helperMaxLinesTextField';
    const valInt = kInputDecorationThemeHelperMaxLines + 1;
    final valStr = valInt.toString();

    testWidgets('render widget', (tester) async {
      final state = InputDecorationThemeState.withTheme(helperMaxLines: valInt);

      await pumpApp(tester, state);

      await tester.expectTextField(key, valStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        valStr,
        inputDecorationThemeCubit.helperMaxLinesChanged,
      );
    });
  });

  group('floating label behavior dropdown', () {
    const key = 'inputDecorationThemeEditor_floatingLabelBehaviorDropdown';

    for (var behavior in FloatingLabelBehavior.values) {
      final behaviorStr = UtilService.enumToString(behavior);

      testWidgets('render $behavior', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          floatingLabelBehavior: behavior,
        );

        await pumpApp(tester, state);

        await tester.expectDropdown(key, behaviorStr);
        if (behavior != inputDecorationThemeState.theme.floatingLabelBehavior) {
          expectBlocBuilder(tester, key, state);
        }
      });

      testWidgets('change $behavior', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          behaviorStr,
          inputDecorationThemeCubit.floatingLabelBehaviorChanged,
        );
      });
    }
  });

  group('border dropdown', () {
    const key = 'inputDecorationThemeEditor_borderDropdown';
    final inputBorderEnum = InputBorderEnum();

    for (var border in inputBorderEnum.values) {
      final borderStr = inputBorderEnum.convertToString(border)!;

      testWidgets('render $border', (tester) async {
        final state = InputDecorationThemeState.withTheme(border: border);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, borderStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $border', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          borderStr,
          inputDecorationThemeCubit.borderChanged,
        );
      });
    }
  });

  group('border radius text field', () {
    const key = 'inputDecorationThemeEditor_borderRadiusTextField';

    testWidgets('render widget', (tester) async {
      final state = InputDecorationThemeState.withTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(doubleNum),
        ),
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change value', (tester) async {
      final state = InputDecorationThemeState.withTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(doubleNum + 1),
        ),
      );
      await pumpApp(tester, state);
      await tester.verifyTextField(
        key,
        doubleStr,
        inputDecorationThemeCubit.borderRadiusChanged,
      );
    });
  });

  group('enabled border side', () {
    group('color picker', () {
      testWidgets('render widget', (tester) async {
        const key = 'inputDecorationThemeEditor_enabledBorderSideFields';
        final state = InputDecorationThemeState.withTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        );

        await pumpApp(tester, state);

        await tester.expectColorIndicator(key, color);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change color', (tester) async {
        const key = 'borderSideFields_colorPicker_enabled';
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          inputDecorationThemeCubit.enabledBorderSideColorChanged,
        );
      });
    });

    group('width text field', () {
      const key = 'borderSideFields_widthTextField_enabled';

      testWidgets('render widget', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: doubleNum),
          ),
        );

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          inputDecorationThemeCubit.enabledBorderSideWidthChanged,
        );
      });
    });
  });

  group('disabled border side', () {
    group('color picker', () {
      const key = 'borderSideFields_colorPicker_disabled';

      testWidgets('render widget', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        );
        await pumpApp(tester, state);
        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        final opaqueColor = color.withOpacity(0.38);
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          opaqueColor,
          inputDecorationThemeCubit.disabledBorderSideColorChanged,
        );
      });
    });

    group('width text field', () {
      const key = 'borderSideFields_widthTextField_disabled';

      testWidgets('render widget', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: doubleNum),
          ),
        );

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          inputDecorationThemeCubit.disabledBorderSideWidthChanged,
        );
      });
    });
  });

  group('error border side', () {
    group('color picker', () {
      const key = 'borderSideFields_colorPicker_error';

      testWidgets('render widget', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
        );
        await pumpApp(tester, state);
        await tester.expectColorIndicator(key, color);
      });

      testWidgets('change color', (tester) async {
        await pumpApp(tester);
        await tester.verifyColorPicker(
          key,
          color,
          inputDecorationThemeCubit.errorBorderSideColorChanged,
        );
      });
    });

    group('width text field', () {
      const key = 'borderSideFields_widthTextField_error';

      testWidgets('render widget', (tester) async {
        final state = InputDecorationThemeState.withTheme(
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: doubleNum),
          ),
        );

        await pumpApp(tester, state);

        await tester.expectTextField(key, doubleStr);
      });

      testWidgets('change value', (tester) async {
        await pumpApp(tester);
        await tester.verifyTextField(
          key,
          doubleStr,
          inputDecorationThemeCubit.errorBorderSideWidthChanged,
        );
      });
    });
  });
}
