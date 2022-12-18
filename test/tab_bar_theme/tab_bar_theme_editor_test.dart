import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'Tab bar');

  late TabBarThemeCubit tabBarThemeCubit;
  late TabBarLabelTextStyleCubit tabBarLabelTextStyleCubit;
  late TabBarUnselectedLabelTextStyleCubit tabBarUnselectedLabelTextStyleCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;

  setUp(() {
    tabBarThemeCubit = MockTabBarThemeCubit();
    tabBarLabelTextStyleCubit = MockTabBarLabelTextStyleCubit();
    tabBarUnselectedLabelTextStyleCubit =
        MockTabBarUnselectedLabelTextStyleCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();

    when(() => tabBarThemeCubit.state).thenReturn(const TabBarThemeState());
    when(() => tabBarLabelTextStyleCubit.state).thenReturn(
      TextStyleState(style: TabBarThemeCubit.defaultLabelTextStyle),
    );
    when(() => tabBarUnselectedLabelTextStyleCubit.state).thenReturn(
      TextStyleState(style: TabBarThemeCubit.defaultLabelTextStyle),
    );
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, TabBarThemeState state) async {
    whenListen(
      tabBarThemeCubit,
      Stream.fromIterable([const TabBarThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: tabBarThemeCubit),
          BlocProvider.value(value: tabBarLabelTextStyleCubit),
          BlocProvider.value(value: tabBarUnselectedLabelTextStyleCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const TabBarThemeEditor()),
        ),
      ),
    );
  }

  testWidgets('display nested editors', (tester) async {
    await pumpApp(tester, const TabBarThemeState());
    expect(
      find.byKey(const Key('tabBarThemeEditor_labelTextStyleCard')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('tabBarThemeEditor_unselectedLabelTextStyleCard')),
      findsOneWidget,
    );
  });

  testWidgets(
    'label color picker update with selected color',
    (tester) async {
      final state = TabBarThemeState(theme: TabBarTheme(labelColor: color));

      await pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'tabBarThemeEditor_labelColorPicker',
        color,
      );
      verify(() => tabBarThemeCubit.labelColorChanged(color)).called(1);
    },
  );

  testWidgets(
    'unselected label color picker update with selected color',
    (tester) async {
      final color = getRandomColor();
      final state = TabBarThemeState(
        theme: TabBarTheme(unselectedLabelColor: color),
      );

      await pumpApp(tester, state);

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
        'update to $size',
        (tester) async {
          final state = TabBarThemeState(
            theme: TabBarTheme(indicatorSize: size),
          );

          await pumpApp(tester, state);

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
