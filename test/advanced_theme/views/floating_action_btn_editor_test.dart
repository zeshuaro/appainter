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

Future<void> main() async {
  final _widgetTesters = WidgetTesters(expandText: 'Floating Action Button');
  late AdvancedThemeCubit cubit;
  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('displays FloatingActionBtnEditor', (tester) async {
    await tester.pumpApp(FloatingActionBtnEditor(), advancedThemeCubit: cubit);
    expect(find.byType(FloatingActionBtnEditor), findsOneWidget);
  });

  testWidgets(
    'background color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = FloatingActionButtonThemeData(backgroundColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_bgColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'foregound color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = FloatingActionButtonThemeData(foregroundColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_fgColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'focus color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = FloatingActionButtonThemeData(focusColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_focusColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'hover color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = FloatingActionButtonThemeData(hoverColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_hoverColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'splash color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = FloatingActionButtonThemeData(splashColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkColorPicker(
        tester,
        'floatingActionBtnEditor_splashColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = FloatingActionButtonThemeData(elevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_elevationTextField',
        value,
      );
    },
  );

  testWidgets(
    'disabled elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = FloatingActionButtonThemeData(disabledElevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_disabledElevationTextField',
        value,
      );
    },
  );

  testWidgets(
    'focus elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = FloatingActionButtonThemeData(focusElevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_focusElevationTextField',
        value,
      );
    },
  );

  testWidgets(
    'highlight elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = FloatingActionButtonThemeData(highlightElevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_highlightElevationTextField',
        value,
      );
    },
  );

  testWidgets(
    'hover elevation should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final theme = FloatingActionButtonThemeData(hoverElevation: value);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(
          themeData: ThemeData(floatingActionButtonTheme: theme),
        ),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await _widgetTesters.checkTextField(
        tester,
        'floatingActionBtnEditor_hoverElevationTextField',
        value,
      );
    },
  );
}
