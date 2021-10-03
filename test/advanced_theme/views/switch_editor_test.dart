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
  final widgetTesters = WidgetTesters(expandText: 'Switch');
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

    await tester.pumpApp(const SwitchEditor(), advancedThemeCubit: cubit);
  }

  testWidgets('shoud display SwitchEditor', (tester) async {
    await tester.pumpApp(const SwitchEditor(), advancedThemeCubit: cubit);
    expect(find.byType(SwitchEditor), findsOneWidget);
  });

  testWidgets(
    'thumb color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final thumbColor = MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        if (states.contains(MaterialState.selected)) {
          return color;
        }
        return Colors.grey.shade50;
      });
      final state = AdvancedThemeState(
        themeData: ThemeData(
          switchTheme: SwitchThemeData(thumbColor: thumbColor),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'switchEditor_thumbColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'track color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final trackColor = MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.black12;
        }
        if (states.contains(MaterialState.selected)) {
          return color.withAlpha(0x80);
        }
        return const Color(0x52000000);
      });
      final state = AdvancedThemeState(
        themeData: ThemeData(
          switchTheme: SwitchThemeData(trackColor: trackColor),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'switchEditor_trackColorPicker',
        color,
        expectedColor: color.withAlpha(0x80),
      );
    },
  );

  testWidgets(
    'splash radius text field should update with value',
    (tester) async {
      final value = Random().nextDouble();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          switchTheme: SwitchThemeData(splashRadius: value),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'switchEditor_splashRadiusTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
