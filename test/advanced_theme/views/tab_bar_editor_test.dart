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
  final widgetTesters = WidgetTesters(expandText: 'Tab Bar');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('displays TabBarEditor', (tester) async {
    await tester.pumpApp(TabBarEditor(), advancedThemeCubit: cubit);
    expect(find.byType(TabBarEditor), findsOneWidget);
  });

  testWidgets(
    'label color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final tabBarTheme = TabBarTheme(labelColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(tabBarTheme: tabBarTheme)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'tabBarEditor_labelColorPicker',
        color,
      );
    },
  );

  testWidgets(
    'unselected label color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final tabBarTheme = TabBarTheme(unselectedLabelColor: color);
      when(() => cubit.state).thenReturn(
        AdvancedThemeState(themeData: ThemeData(tabBarTheme: tabBarTheme)),
      );

      await tester.pumpApp(AdvancedEditor(), advancedThemeCubit: cubit);
      await widgetTesters.checkColorPicker(
        tester,
        'tabBarEditor_unselectedLabelColorPicker',
        color,
      );
    },
  );
}
