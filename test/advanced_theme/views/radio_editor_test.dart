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
  final widgetTesters = WidgetTesters(expandText: 'Radio');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
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

    await tester.pumpApp(const RadioEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('shoud display RadioEditor', (tester) async {
    await tester.pumpApp(const RadioEditor(), advancedThemeCubit: cubit);
    expect(find.byType(RadioEditor), findsOneWidget);
  });

  testWidgets(
    'fill color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final theme = ThemeData();
      final fillColor = MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return theme.disabledColor;
        }
        if (states.contains(MaterialState.selected)) {
          return color;
        }
        return theme.unselectedWidgetColor;
      });
      final state = AdvancedThemeState(
        themeData: ThemeData(
          radioTheme: RadioThemeData(fillColor: fillColor),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'radioEditor_fillColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          radioTheme: RadioThemeData(splashRadius: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'radioEditor_splashRadiusTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
