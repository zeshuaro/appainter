import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Input decoration');

  late InputDecorationThemeCubit inputDecorationThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleNum;

  setUp(() {
    inputDecorationThemeCubit = MockInputDecorationThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleNum = Random().nextDouble();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    InputDecorationThemeState state,
  ) async {
    whenListen(
      inputDecorationThemeCubit,
      Stream.fromIterable([state]),
      initialState: const InputDecorationThemeState(),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: inputDecorationThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const InputDecorationThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'fill color picker should update with color',
    (tester) async {
      final state = InputDecorationThemeState(
        theme: InputDecorationTheme(fillColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'inputDecorationThemeEditor_fillColorPicker',
        color,
      );
      verify(() => inputDecorationThemeCubit.fillColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with color',
    (tester) async {
      final state = InputDecorationThemeState(
        theme: InputDecorationTheme(hoverColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'inputDecorationThemeEditor_hoverColorPicker',
        color,
      );
      verify(
        () => inputDecorationThemeCubit.hoverColorChanged(color),
      ).called(1);
    },
  );

  group('test align label with hint switch', () {
    for (var shouldAlign in [true, false]) {
      testWidgets(
        'should be toggled to $shouldAlign',
        (tester) async {
          final state = InputDecorationThemeState(
            theme: InputDecorationTheme(alignLabelWithHint: shouldAlign),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'inputDecorationThemeEditor_alignLabelWithHintSwitch',
            shouldAlign,
          );
          verify(() {
            inputDecorationThemeCubit.alignLabelWithHintChanged(!shouldAlign);
          }).called(1);
        },
      );
    }
  });

  group('test filled switch', () {
    for (var isFilled in [true, false]) {
      testWidgets(
        'should be toggled to $isFilled',
        (tester) async {
          final state = InputDecorationThemeState(
            theme: InputDecorationTheme(filled: isFilled),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'inputDecorationThemeEditor_filledSwitch',
            isFilled,
          );
          verify(
            () => inputDecorationThemeCubit.filledChanged(!isFilled),
          ).called(1);
        },
      );
    }
  });

  group('test is collapsed switch', () {
    for (var isCollapsed in [true, false]) {
      testWidgets(
        'should be toggled to $isCollapsed',
        (tester) async {
          final state = InputDecorationThemeState(
            theme: InputDecorationTheme(isCollapsed: isCollapsed),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'inputDecorationThemeEditor_isCollapsedSwitch',
            isCollapsed,
          );
          verify(
            () => inputDecorationThemeCubit.isCollapsedChanged(!isCollapsed),
          ).called(1);
        },
      );
    }
  });

  group('test is dense switch', () {
    for (var isDense in [true, false]) {
      testWidgets(
        'should be toggled to $isDense',
        (tester) async {
          final state = InputDecorationThemeState(
            theme: InputDecorationTheme(isDense: isDense),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'inputDecorationThemeEditor_isDenseSwitch',
            isDense,
          );
          verify(
            () => inputDecorationThemeCubit.isDenseChanged(!isDense),
          ).called(1);
        },
      );
    }
  });

  testWidgets(
    'error max lines should update with value',
    (tester) async {
      const value = kInputDecorationThemeErrorMaxLines + 1;
      const state = InputDecorationThemeState(
        theme: InputDecorationTheme(errorMaxLines: value),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'inputDecorationThemeEditor_errorMaxLinesTextField',
        value,
      );
      verify(
        () => inputDecorationThemeCubit.errorMaxLinesChanged(value.toString()),
      ).called(1);
    },
  );

  testWidgets(
    'helper max lines should update with value',
    (tester) async {
      const value = kInputDecorationThemeHelperMaxLines + 1;
      const state = InputDecorationThemeState(
        theme: InputDecorationTheme(helperMaxLines: value),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'inputDecorationThemeEditor_helperMaxLinesTextField',
        value,
      );
      verify(
        () => inputDecorationThemeCubit.helperMaxLinesChanged(value.toString()),
      ).called(1);
    },
  );

  group('test floating label behavior dropdown', () {
    for (var behavior in FloatingLabelBehavior.values) {
      final behaviorStr = UtilService.enumToString(behavior);

      testWidgets(
        'should update to $behavior',
        (tester) async {
          final state = InputDecorationThemeState(
            theme: InputDecorationTheme(floatingLabelBehavior: behavior),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'inputDecorationThemeEditor_floatingLabelBehaviorDropdown',
            behaviorStr,
          );
          verify(
            () {
              inputDecorationThemeCubit.floatingLabelBehaviorChanged(
                behaviorStr,
              );
            },
          ).called(1);
        },
      );
    }
  });

  group('test border dropdown', () {
    final inputBorderEnum = InputBorderEnum();
    for (var border in inputBorderEnum.values) {
      final borderStr = inputBorderEnum.convertToString(border)!;

      testWidgets(
        'should update to border with isOutline=${border.isOutline}',
        (tester) async {
          final state = InputDecorationThemeState(
            theme: InputDecorationTheme(border: border),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'inputDecorationThemeEditor_borderDropdown',
            borderStr,
          );
          verify(
            () => inputDecorationThemeCubit.borderChanged(borderStr),
          ).called(1);
        },
      );
    }
  });

  testWidgets(
    'border radius text field should update with value',
    (tester) async {
      final state = InputDecorationThemeState(
        theme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'inputDecorationThemeEditor_borderRadiusTextField',
        doubleNum,
      );
      verify(
        () => inputDecorationThemeCubit.borderRadiusChanged(
          doubleNum.toString(),
        ),
      ).called(1);
    },
  );

  group('test enabled border side fields', () {
    const key = 'enabled';
    testWidgets(
      'color picker should update with color',
      (tester) async {
        final state = InputDecorationThemeState(
          theme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'borderSideFields_colorPicker_$key',
          color,
        );
        verify(
          () => inputDecorationThemeCubit.enabledBorderSideColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'width text field should update with value',
      (tester) async {
        final state = InputDecorationThemeState(
          theme: InputDecorationTheme(
            border: UnderlineInputBorder(
              borderSide: BorderSide(width: doubleNum),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'borderSideFields_widthTextField_$key',
          doubleNum,
        );
        verify(
          () => inputDecorationThemeCubit.enabledBorderSideWidthChanged(
            doubleNum.toString(),
          ),
        ).called(1);
      },
    );
  });

  group('test disabled border side fields', () {
    const key = 'disabled';
    testWidgets(
      'color picker should update with color',
      (tester) async {
        final state = InputDecorationThemeState(
          theme: InputDecorationTheme(
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'borderSideFields_colorPicker_$key',
          color,
        );
        verify(
          () => inputDecorationThemeCubit.disabledBorderSideColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'width text field should update with value',
      (tester) async {
        final state = InputDecorationThemeState(
          theme: InputDecorationTheme(
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: doubleNum),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'borderSideFields_widthTextField_$key',
          doubleNum,
        );
        verify(
          () => inputDecorationThemeCubit.disabledBorderSideWidthChanged(
            doubleNum.toString(),
          ),
        ).called(1);
      },
    );
  });

  group('test error border side fields', () {
    const key = 'error';
    testWidgets(
      'color picker should update with color',
      (tester) async {
        final state = InputDecorationThemeState(
          theme: InputDecorationTheme(
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'borderSideFields_colorPicker_$key',
          color,
        );
        verify(
          () => inputDecorationThemeCubit.errorBorderSideColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'width text field should update with value',
      (tester) async {
        final state = InputDecorationThemeState(
          theme: InputDecorationTheme(
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: doubleNum),
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'borderSideFields_widthTextField_$key',
          doubleNum,
        );
        verify(
          () => inputDecorationThemeCubit.errorBorderSideWidthChanged(
            doubleNum.toString(),
          ),
        ).called(1);
      },
    );
  });
}
