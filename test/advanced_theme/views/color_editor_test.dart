import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

void main() {
  final widget = MyExpansionPanelList(item: const ColorEditor());
  final widgetTesters = WidgetTesters(expandText: 'Colors');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(widget, advancedThemeCubit: cubit);
  }

  testWidgets('displays ColorEditor', (tester) async {
    await tester.pumpApp(widget, advancedThemeCubit: cubit);
    expect(find.byType(ColorEditor), findsOneWidget);
  });

  testWidgets(
    'primary color light picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(primaryColorLight: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_primaryColorLightPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'primary color dark picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(primaryColorDark: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_primaryColorDarkPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(backgroundColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_backgroundColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'bottom app bar color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(bottomAppBarColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_bottomAppBarColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'canvas color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(canvasColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_canvasColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'card color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(cardColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_cardColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'dialog background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(dialogBackgroundColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_dialogBackgroundColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'disabled color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(disabledColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_disabledColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'divider color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(dividerColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_dividerColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'error color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(errorColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_errorColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(focusColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_focusColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'highlight color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(highlightColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_highlightColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'hint color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(hintColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_hintColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(hoverColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_hoverColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'indicator color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(indicatorColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_indicatorColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'scaffold background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(scaffoldBackgroundColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_scaffoldBackgroundColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'secondary header color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(secondaryHeaderColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_secondaryHeaderColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'selected row color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(selectedRowColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_selectedRowColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(shadowColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_shadowColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(splashColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_splashColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'toggleable active color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(toggleableActiveColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_toggleableActiveColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'unselected widget color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(unselectedWidgetColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_unselectedWidgetColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
