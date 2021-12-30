import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/services/util_service.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Tab Bar');

  late TabBarThemeCubit tabBarThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;

  setUp(() {
    tabBarThemeCubit = MockTabBarThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();

    when(() => tabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, TabBarThemeState state) async {
    whenListen(
      tabBarThemeCubit,
      Stream.fromIterable([const TabBarThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: tabBarThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const TabBarThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'label color picker should update with selected color',
    (tester) async {
      final state = TabBarThemeState(theme: TabBarTheme(labelColor: color));

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'tabBarThemeEditor_labelColorPicker',
        color,
      );
      verify(() => tabBarThemeCubit.labelColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'unselected label color picker should update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = TabBarThemeState(
        theme: TabBarTheme(unselectedLabelColor: color),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'tabBarThemeEditor_unselectedLabelColorPicker',
        color,
      );
      verify(() {
        tabBarThemeCubit.unselectedLabelColorChanged(color);
      }).called(1);
    },
  );

  group('test indicator size dropdown', () {
    for (var size in TabBarIndicatorSize.values) {
      final sizeStr = UtilService.enumToString(size);
      testWidgets(
        'should update to $size',
        (tester) async {
          final state = TabBarThemeState(
            theme: TabBarTheme(indicatorSize: size),
          );

          await _pumpApp(tester, state);

          await widgetTesters.checkDropbox(
            tester,
            'tabBarThemeEditor_indicatorSizeDropdown',
            sizeStr,
          );
          verify(() {
            tabBarThemeCubit.indicatorSizeChanged(sizeStr);
          }).called(1);
        },
      );
    }
  });
}
