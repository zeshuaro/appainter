import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'App bar';
  const appbarThemeState = AppBarThemeState();
  const iconThemeState = IconThemeState();

  late AppBarThemeCubit appBarThemeCubit;
  late AppBarActionsIconThemeCubit appBarActionsIconThemeCubit;
  late AppBarIconThemeCubit appBarIconThemeCubit;
  late AppBarTitleTextStyleCubit appBarTitleTextStyleCubit;
  late AppBarToolbarTextStyleCubit appBarToolbarTextStyleCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    appBarThemeCubit = MockAppBarThemeCubit();
    appBarActionsIconThemeCubit = MockAppBarActionsIconThemeCubit();
    appBarIconThemeCubit = MockAppBarIconThemeCubit();
    appBarTitleTextStyleCubit = MockAppBarTitleTextStyleCubit();
    appBarToolbarTextStyleCubit = MockAppBarToolbarTextStyleCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => appBarActionsIconThemeCubit.state).thenReturn(
      iconThemeState,
    );
    when(() => appBarIconThemeCubit.state).thenReturn(
      iconThemeState,
    );
    when(() => appBarTitleTextStyleCubit.state).thenReturn(
      TextStyleState(
        style: AppBarThemeCubit.defaultTitleTextStyle,
      ),
    );
    when(() => appBarToolbarTextStyleCubit.state).thenReturn(
      TextStyleState(
        style: AppBarThemeCubit.defaultToolbarTextStyle,
      ),
    );
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> pumpApp(WidgetTester tester, [AppBarThemeState? state]) async {
    when(() => appBarThemeCubit.state).thenReturn(state ?? appbarThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: appBarThemeCubit),
            BlocProvider.value(value: appBarActionsIconThemeCubit),
            BlocProvider.value(value: appBarIconThemeCubit),
            BlocProvider.value(value: appBarTitleTextStyleCubit),
            BlocProvider.value(value: appBarToolbarTextStyleCubit),
            BlocProvider.value(value: colorThemeCubit),
          ],
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const AppBarThemeEditor(),
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
    AppBarThemeState state,
  ) {
    tester.expectBlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key,
      appbarThemeState,
      state,
    );
  }

  testWidgets('display nested editors', (tester) async {
    await pumpApp(tester);

    expect(
      find.byKey(const Key('appBarThemeEditor_systemOverlayStyleCard')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('appBarThemeEditor_iconThemeCard')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('appBarThemeEditor_actionsIconThemeCard')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('appBarThemeEditor_titleTextStyleCard')),
      findsOneWidget,
    );
    expect(
      find.byKey(const Key('appBarThemeEditor_toolbarTextStyleCard')),
      findsOneWidget,
    );
  });

  group('background color picker', () {
    const key = 'appBarThemeEditor_backgroundColorPicker';

    testWidgets('render background color', (tester) async {
      final state = AppBarThemeState.withTheme(backgroundColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change background color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        appBarThemeCubit.backgroundColorChanged,
      );
    });
  });

  group('foreground color picker', () {
    const key = 'appBarThemeEditor_foregroundColorPicker';

    testWidgets('render foreground color', (tester) async {
      final state = AppBarThemeState.withTheme(foregroundColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change foreground color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        appBarThemeCubit.foregroundColorChanged,
      );
    });
  });

  group('elevation text field', () {
    const key = 'appBarThemeEditor_elevationTextField';

    testWidgets('render elevation', (tester) async {
      final state = AppBarThemeState.withTheme(elevation: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change elevation', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        appBarThemeCubit.elevationChanged,
      );
    });
  });

  group('shadow color picker', () {
    const key = 'appBarThemeEditor_shadowColorPicker';

    testWidgets('render shadow color', (tester) async {
      final state = AppBarThemeState.withTheme(shadowColor: color);
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change shadow color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color,
        appBarThemeCubit.shadowColorChanged,
      );
    });
  });

  group('center title switch', () {
    const key = 'appBarThemeEditor_centerTitleSwitch';

    for (var isCenter in [true, false]) {
      testWidgets('render isCenter=$isCenter', (tester) async {
        final state = AppBarThemeState.withTheme(centerTitle: isCenter);

        await pumpApp(tester, state);

        tester.expectSwitch(key, isCenter);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change isCenter=$isCenter', (tester) async {
        final state = AppBarThemeState.withTheme(centerTitle: !isCenter);

        await pumpApp(tester, state);
        await tester.verifySwitch(
          key,
          isCenter,
          appBarThemeCubit.centerTitleChanged,
        );
      });
    }
  });

  group('title spacing text field', () {
    const key = 'appBarThemeEditor_titleSpacingTextField';

    testWidgets('render title spacing', (tester) async {
      final state = AppBarThemeState.withTheme(titleSpacing: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change title spacing', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        appBarThemeCubit.titleSpacingChanged,
      );
    });
  });

  group('tool bar height text field', () {
    const key = 'appBarThemeEditor_toolBarHeightTextField';

    testWidgets('render tool bar height', (tester) async {
      final state = AppBarThemeState.withTheme(toolbarHeight: doubleNum);

      await pumpApp(tester, state);

      await tester.expectTextField(key, doubleStr);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change tool bar height', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        appBarThemeCubit.toolBarHeightChanged,
      );
    });
  });
}
