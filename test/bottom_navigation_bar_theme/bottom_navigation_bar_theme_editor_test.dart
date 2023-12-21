import 'dart:math';

import 'package:appainter/abstract_text_style/cubit/abstract_text_style_cubit.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'Bottom navigation bar';
  const bottomNavigationBarThemeState = BottomNavigationBarThemeState();
  final defaultLabelTextStyle =
      BottomNavigationBarThemeCubit.defaultLabelTextStyle;

  late BottomNavigationBarThemeCubit bottomNavigationBarThemeCubit;
  late BottomNavigationBarLabelTextStyleCubit
      bottomNavigationBarLabelTextStyleCubit;
  late BottomNavigationBarUnselectedLabelTextStyleCubit
      bottomNavigationBarUnselectedLabelTextStyleCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    bottomNavigationBarThemeCubit = MockBottomNavigationBarThemeCubit();
    bottomNavigationBarLabelTextStyleCubit =
        MockBottomNavigationBarLabelTextStyleCubit();
    bottomNavigationBarUnselectedLabelTextStyleCubit =
        MockBottomNavigationBarUnselectedLabelTextStyleCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(
      () => bottomNavigationBarLabelTextStyleCubit.state,
    ).thenReturn(TextStyleState(style: defaultLabelTextStyle));
    when(
      () => bottomNavigationBarUnselectedLabelTextStyleCubit.state,
    ).thenReturn(TextStyleState(style: defaultLabelTextStyle));
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(
    WidgetTester tester, [
    BottomNavigationBarThemeState? state,
  ]) async {
    when(
      () => bottomNavigationBarThemeCubit.state,
    ).thenReturn(state ?? bottomNavigationBarThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: bottomNavigationBarThemeCubit),
            BlocProvider.value(value: bottomNavigationBarLabelTextStyleCubit),
            BlocProvider.value(
              value: bottomNavigationBarUnselectedLabelTextStyleCubit,
            ),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const BottomNavigationBarThemeEditor(),
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
    BottomNavigationBarThemeState state,
  ) {
    tester.expectBlocBuilder<BottomNavigationBarThemeCubit,
        BottomNavigationBarThemeState>(
      key,
      bottomNavigationBarThemeState,
      state,
    );
  }

  testWidgets('render nested editors', (tester) async {
    await pumpApp(tester);

    for (var key in [
      'bottomNavigationBarThemeEditor_labelTextStyleCard',
      'bottomNavigationBarThemeEditor_unselectedLabelTextStyleCard',
    ]) {
      expect(find.byKey(Key(key)), findsOneWidget);
    }
  });

  group('background color picker', () {
    const key = 'bottomNavigationBarThemeEditor_backgroundColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BottomNavigationBarThemeState.withThemeData(
        backgroundColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        bottomNavigationBarThemeCubit.backgroundColorChanged,
      );
    });
  });

  group('selected item color picker', () {
    const key = 'bottomNavigationBarThemeEditor_selectedItemColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BottomNavigationBarThemeState.withThemeData(
        selectedItemColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        bottomNavigationBarThemeCubit.selectedItemColorChanged,
      );
    });
  });

  group('unselected item color picker', () {
    const key = 'bottomNavigationBarThemeEditor_unselectedItemColorPicker';

    testWidgets('render widget', (tester) async {
      final state = BottomNavigationBarThemeState.withThemeData(
        unselectedItemColor: color,
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0.54);
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        bottomNavigationBarThemeCubit.unselectedItemColorChanged,
      );
    });
  });

  group('show selected labels switch', () {
    const key = 'bottomNavigationBarThemeEditor_showSelectedLabelsSwitch';

    for (var isShow in [true, false]) {
      testWidgets('render widget with $isShow', (tester) async {
        final state = BottomNavigationBarThemeState.withThemeData(
          showSelectedLabels: isShow,
        );

        await pumpApp(tester, state);

        tester.expectSwitch(key, isShow);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change switch to $isShow', (tester) async {
        final state = BottomNavigationBarThemeState.withThemeData(
          showSelectedLabels: !isShow,
        );

        await pumpApp(tester, state);

        await tester.verifySwitch(
          key,
          isShow,
          bottomNavigationBarThemeCubit.showSelectedLabelsChanged,
        );
      });
    }
  });

  group('show unselected labels switch', () {
    const key = 'bottomNavigationBarThemeEditor_showUnselectedLabelsSwitch';

    for (var isShow in [true, false]) {
      testWidgets('render widget with $isShow', (tester) async {
        final state = BottomNavigationBarThemeState.withThemeData(
          showUnselectedLabels: isShow,
        );

        await pumpApp(tester, state);

        tester.expectSwitch(key, isShow);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change switch to $isShow', (tester) async {
        final state = BottomNavigationBarThemeState.withThemeData(
          showUnselectedLabels: !isShow,
        );

        await pumpApp(tester, state);

        await tester.verifySwitch(
          key,
          isShow,
          bottomNavigationBarThemeCubit.showUnselectedLabelsChanged,
        );
      });
    }
  });

  group('elevation text field', () {
    const key = 'bottomNavigationBarThemeEditor_elevationTextField';

    testWidgets('render widget', (tester) async {
      final state = BottomNavigationBarThemeState.withThemeData(
        elevation: doubleNum,
      );

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change text', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        bottomNavigationBarThemeCubit.elevationChanged,
      );
    });
  });

  group('type dropdown', () {
    const key = 'bottomNavigationBarThemeEditor_typeDropdown';

    for (var type in BottomNavigationBarType.values) {
      final typeStr = UtilService.enumToString(type);

      testWidgets('render $type', (tester) async {
        final state = BottomNavigationBarThemeState.withThemeData(type: type);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, typeStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $type', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          typeStr,
          bottomNavigationBarThemeCubit.typeChanged,
        );
      });
    }
  });
}
