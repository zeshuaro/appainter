import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
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
          child: const Scaffold(
            body: AppBarThemeEditor(),
          ),
        ),
      ),
    );
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
    expect(find.byType(ActionsIconThemeCard), findsOneWidget);
    expect(find.byType(IconThemeCard), findsOneWidget);
    expect(find.byType(TitleTextStyleCard), findsOneWidget);
    expect(find.byType(ToolbarTextStyleCard), findsOneWidget);
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
      await tester.pickColor(key, color);

      verify(() => appBarThemeCubit.backgroundColorChanged(color)).called(1);
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
      await tester.pickColor(key, color);

      verify(() => appBarThemeCubit.foregroundColorChanged(color)).called(1);
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
      await tester.enterTextToTextField(key, doubleNum);

      verify(() => appBarThemeCubit.elevationChanged(doubleStr)).called(1);
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
      await tester.pickColor(key, color);

      verify(() => appBarThemeCubit.shadowColorChanged(color)).called(1);
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
        await tester.toggleSwitch(key, isCenter);

        verify(() => appBarThemeCubit.centerTitleChanged(isCenter)).called(1);
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
      await tester.enterTextToTextField(key, doubleNum);

      verify(() => appBarThemeCubit.titleSpacingChanged(doubleStr)).called(1);
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
      await tester.enterTextToTextField(key, doubleNum);

      verify(() => appBarThemeCubit.toolBarHeightChanged(doubleStr)).called(1);
    });
  });

  group('system UI overlay style dropdown', () {
    const key = 'appBarThemeEditor_systemUiOverlayStyleDropdown';
    final myStyle = MySystemUiOverlayStyle();

    for (var style in myStyle.values) {
      final styleStr = myStyle.convertToString(style)!;

      testWidgets('render ${style.statusBarBrightness}', (tester) async {
        final state = AppBarThemeState.withTheme(systemUiOverlayStyle: style);

        await pumpApp(tester, state);

        await tester.expectDropdown(key, styleStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change ${style.statusBarBrightness}', (tester) async {
        await pumpApp(tester);
        await tester.selectDropdownItem(key, styleStr);

        verify(
          () => appBarThemeCubit.systemUiOverlayStyleChanged(styleStr),
        ).called(1);
      });
    }
  });
}
