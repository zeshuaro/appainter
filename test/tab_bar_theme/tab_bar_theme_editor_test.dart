import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'Tab bar';
  const tabBarThemeState = TabBarThemeState();
  final defaultLabelTextStyle = TabBarThemeCubit.defaultLabelTextStyle;

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

    when(
      () => tabBarLabelTextStyleCubit.state,
    ).thenReturn(TextStyleState(style: defaultLabelTextStyle));
    when(
      () => tabBarUnselectedLabelTextStyleCubit.state,
    ).thenReturn(TextStyleState(style: defaultLabelTextStyle));
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, [TabBarThemeState? state]) async {
    when(() => tabBarThemeCubit.state).thenReturn(state ?? tabBarThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: tabBarThemeCubit),
            BlocProvider.value(value: tabBarLabelTextStyleCubit),
            BlocProvider.value(value: tabBarUnselectedLabelTextStyleCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const TabBarThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  void expectBlocBuilder(
    WidgetTester tester,
    String key,
    TabBarThemeState state,
  ) {
    tester.expectBlocBuilder<TabBarThemeCubit, TabBarThemeState>(
      key,
      tabBarThemeState,
      state,
    );
  }

  testWidgets('display nested editors', (tester) async {
    await pumpApp(tester);

    expect(
      find.byKey(const Key('tabBarThemeEditor_labelTextStyleCard')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('tabBarThemeEditor_unselectedLabelTextStyleCard')),
      findsOneWidget,
    );
  });

  group('label color picker', () {
    const key = 'tabBarThemeEditor_labelColorPicker';

    testWidgets('render widget', (tester) async {
      final state = TabBarThemeState.withTheme(labelColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        tabBarThemeCubit.labelColorChanged,
      );
    });
  });

  group('unselected label color picker', () {
    const key = 'tabBarThemeEditor_unselectedLabelColorPicker';

    testWidgets('render widget', (tester) async {
      final state = TabBarThemeState.withTheme(unselectedLabelColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.70);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        tabBarThemeCubit.unselectedLabelColorChanged,
      );
    });
  });

  group('indicator size dropdown', () {
    const key = 'tabBarThemeEditor_indicatorSizeDropdown';

    for (var size in TabBarIndicatorSize.values) {
      final sizeStr = UtilService.enumToString(size);

      testWidgets('render $size', (tester) async {
        final state = TabBarThemeState.withTheme(indicatorSize: size);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, sizeStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $size', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          sizeStr,
          tabBarThemeCubit.indicatorSizeChanged,
        );
      });
    }
  });
}
