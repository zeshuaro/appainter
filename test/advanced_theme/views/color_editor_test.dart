import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Colors');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('displays ColorEditor', (tester) async {
    await tester.pumpApp(ColorEditor(), advancedThemeCubit: cubit);
    expect(find.byType(ColorEditor), findsOneWidget);
  });

  testWidgets(
    'primary color light picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(primaryColorLight: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_primaryColorLightPicker',
        color,
      );
    },
  );

  testWidgets(
    'primary color dark picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(primaryColorDark: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_primaryColorDarkPicker',
        color,
      );
    },
  );

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(backgroundColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_backgroundColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'bottom app bar color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(bottomAppBarColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_bottomAppBarColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'canvas color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(canvasColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_canvasColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'card color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(cardColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_cardColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'dialog background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(dialogBackgroundColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_dialogBackgroundColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'disabled color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(disabledColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_disabledColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'divider color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(dividerColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_dividerColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'error color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(errorColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_errorColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(focusColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_focusColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'highlight color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(highlightColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_highlightColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'hint color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(hintColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_hintColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(hoverColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_hoverColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'indicator color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(indicatorColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_indicatorColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'scaffold background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(scaffoldBackgroundColor: color),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_scaffoldBackgroundColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'secondary header color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(secondaryHeaderColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_secondaryHeaderColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'selected row color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(selectedRowColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_selectedRowColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'shadow color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(shadowColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_shadowColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(splashColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_splashColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'toggleable active color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(toggleableActiveColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_toggleableActiveColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'unselected widget color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(unselectedWidgetColor: color)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'colorEditor_unselectedWidgetColorPicker',
        color,
      );
    },
  );
}
