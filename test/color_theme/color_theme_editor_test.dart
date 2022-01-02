import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../brightness.dart';
import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Colors');

  late ColorThemeCubit colorThemeCubit;
  late Color color;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, ColorThemeState state) async {
    whenListen(
      colorThemeCubit,
      Stream.fromIterable([ColorThemeState(), state]),
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: colorThemeCubit,
        child: MaterialApp(
          home: MyExpansionPanelList(item: const ColorThemeEditor()),
        ),
      ),
    );
  }

  group('test primary colors', () {
    testWidgets(
      'color picker should update with selected color',
      (tester) async {
        color = const Color(0xFFF44336);
        final state = ColorThemeState(primaryColor: color);

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'colorThemeEditor_primaryColorPicker',
          color,
        );
        verify(() => colorThemeCubit.primaryColorChanged(color)).called(1);
      },
    );

    for (var test in BrightnessTest.testCases) {
      testWidgets(
        'brightness switch should be toggled to ${test.brightness}',
        (tester) async {
          final state = ColorThemeState(
            primaryColorBrightness: test.brightness,
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkSwitch(
            tester,
            'colorThemeEditor_primaryColorPicker',
            test.isDark,
          );
          verify(() {
            colorThemeCubit.primaryColorBrightnessChanged(!test.isDark);
          }).called(1);
        },
      );
    }
  });

  testWidgets(
    'primary color light picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(primaryColorLight: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_primaryColorLightPicker',
        color,
      );
      verify(() => colorThemeCubit.primaryColorLightChanged(color)).called(1);
    },
  );

  testWidgets(
    'primary color dark picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(primaryColorDark: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_primaryColorDarkPicker',
        color,
      );
      verify(() => colorThemeCubit.primaryColorDarkChanged(color)).called(1);
    },
  );

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(backgroundColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_backgroundColorPicker',
        color,
      );
      verify(() => colorThemeCubit.backgroundColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'bottom app bar color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(bottomAppBarColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_bottomAppBarColorPicker',
        color,
      );
      verify(() => colorThemeCubit.bottomAppBarColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'canvas color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(canvasColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_canvasColorPicker',
        color,
      );
      verify(() => colorThemeCubit.canvasColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'card color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(cardColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_cardColorPicker',
        color,
      );
      verify(() => colorThemeCubit.cardColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'dialog background color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(dialogBackgroundColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_dialogBackgroundColorPicker',
        color,
      );
      verify(() {
        colorThemeCubit.dialogBackgroundColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'disabled color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(disabledColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_disabledColorPicker',
        color,
      );
      verify(() => colorThemeCubit.disabledColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'divider color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(dividerColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_dividerColorPicker',
        color,
      );
      verify(() => colorThemeCubit.dividerColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'error color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(errorColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_errorColorPicker',
        color,
      );
      verify(() => colorThemeCubit.errorColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(focusColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_focusColorPicker',
        color,
      );
      verify(() => colorThemeCubit.focusColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'highlight color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(highlightColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_highlightColorPicker',
        color,
      );
      verify(() => colorThemeCubit.highlightColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'hint color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(hintColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_hintColorPicker',
        color,
      );
      verify(() => colorThemeCubit.hintColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(hoverColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_hoverColorPicker',
        color,
      );
      verify(() => colorThemeCubit.hoverColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'indicator color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(indicatorColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_indicatorColorPicker',
        color,
      );
      verify(() => colorThemeCubit.indicatorColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'scaffold background color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(scaffoldBackgroundColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_scaffoldBackgroundColorPicker',
        color,
      );
      verify(() {
        colorThemeCubit.scaffoldBackgroundColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'secondary header color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(secondaryHeaderColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_secondaryHeaderColorPicker',
        color,
      );
      verify(() {
        colorThemeCubit.secondaryHeaderColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'selected row color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(selectedRowColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_selectedRowColorPicker',
        color,
      );
      verify(() => colorThemeCubit.selectedRowColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final state = ColorThemeState(shadowColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_shadowColorPicker',
        color,
      );
      verify(() => colorThemeCubit.shadowColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = ColorThemeState(splashColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_splashColorPicker',
        color,
      );
      verify(() => colorThemeCubit.splashColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'toggleable active color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = ColorThemeState(toggleableActiveColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_toggleableActiveColorPicker',
        color,
      );
      verify(() {
        colorThemeCubit.toggleableActiveColorChanged(color);
      }).called(1);
    },
  );

  testWidgets(
    'unselected widget color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = ColorThemeState(unselectedWidgetColor: color);

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorThemeEditor_unselectedWidgetColorPicker',
        color,
      );
      verify(() {
        colorThemeCubit.unselectedWidgetColorChanged(color);
      }).called(1);
    },
  );
}
