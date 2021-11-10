import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../../pump_app.dart';
import '../../../utils.dart';
import '../../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Checkbox');
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

    await tester.pumpApp(const CheckboxEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('shoud display CheckboxEditor', (tester) async {
    await tester.pumpApp(const CheckboxEditor(), advancedThemeCubit: cubit);
    expect(find.byType(CheckboxEditor), findsOneWidget);
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
          checkboxTheme: CheckboxThemeData(fillColor: fillColor),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'checkboxEditor_fillColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'check color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final checkColor = MaterialStateProperty.resolveWith((_) {
        return color;
      });
      final state = AdvancedThemeState(
        themeData: ThemeData(
          checkboxTheme: CheckboxThemeData(checkColor: checkColor),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'checkboxEditor_checkColorPicker',
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
          checkboxTheme: CheckboxThemeData(splashRadius: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'checkboxEditor_splashRadiusTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
