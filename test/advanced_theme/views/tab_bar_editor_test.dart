import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  final widget = MyExpansionPanelList(item: const TabBarEditor());
  final widgetTesters = WidgetTesters(expandText: 'Tab Bar');
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

  testWidgets('displays TabBarEditor', (tester) async {
    await tester.pumpApp(widget, advancedThemeCubit: cubit);
    expect(find.byType(TabBarEditor), findsOneWidget);
  });

  testWidgets(
    'label color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          tabBarTheme: TabBarTheme(labelColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'tabBarEditor_labelColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'unselected label color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          tabBarTheme: TabBarTheme(unselectedLabelColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'tabBarEditor_unselectedLabelColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
