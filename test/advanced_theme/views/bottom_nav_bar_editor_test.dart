import 'dart:math';

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
  final widgetTesters = WidgetTesters(expandText: 'Bottom Navigation Bar');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('displays BottomNavBarEditor', (tester) async {
    await tester.pumpApp(BottomNavBarEditor(), advancedThemeCubit: cubit);
    expect(find.byType(BottomNavBarEditor), findsOneWidget);
  });

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = BottomNavigationBarThemeData(backgroundColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(bottomNavigationBarTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavBarEditor_bgColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'selected item color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = BottomNavigationBarThemeData(selectedItemColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(bottomNavigationBarTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavBarEditor_selectedItemColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'unselected item color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = BottomNavigationBarThemeData(unselectedItemColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(bottomNavigationBarTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'bottomNavBarEditor_unselectedItemColorPicker',
        color,
      );
    },
  );

  for (var isShow in [true, false]) {
    testWidgets(
      'show selected labels switch should be toggled with $isShow',
      (tester) async {
        final theme = BottomNavigationBarThemeData(showSelectedLabels: isShow);
        when(() => cubit.state).thenReturn(
          AdvancedThemeState(
            themeData: ThemeData(bottomNavigationBarTheme: theme),
          ),
        );

        await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
        await widgetTesters.checkSwitch(
          tester,
          'bottomNavBarEditor_showSelectedLabelsSwitch',
          isShow,
        );
      },
    );

    testWidgets(
      'show unselected labels switch should be toggled with $isShow',
      (tester) async {
        final theme = BottomNavigationBarThemeData(
          showUnselectedLabels: isShow,
        );
        when(() => cubit.state).thenReturn(
          AdvancedThemeState(
            themeData: ThemeData(bottomNavigationBarTheme: theme),
          ),
        );

        await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
        await widgetTesters.checkSwitch(
          tester,
          'bottomNavBarEditor_showUnselectedLabelsSwitch',
          isShow,
        );
      },
    );
  }

  testWidgets(
    'elevation text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = BottomNavigationBarThemeData(elevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(bottomNavigationBarTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkTextField(
        tester,
        'bottomNavBarEditor_elevationTextField',
        value,
      );
    },
  );
}
