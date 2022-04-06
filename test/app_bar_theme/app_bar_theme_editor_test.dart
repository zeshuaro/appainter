import 'dart:math';

import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/cubit/abstract_text_style_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/models/models.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  const defaultAppBarThemeState = AppBarThemeState();
  const defaultIconThemeState = IconThemeState();
  final defaultTextStyleState = TextStyleState(style: kAppBarTitleTextStyle);
  final widgetTesters = WidgetTesters();

  late AppBarThemeCubit appBarThemeCubit;
  late AppBarActionsIconThemeCubit appBarActionsIconThemeCubit;
  late AppBarIconThemeCubit appBarIconThemeCubit;
  late AppBarTitleTextStyleCubit appBarTitleTextStyleCubit;
  late ColorThemeCubit colorThemeCubit;

  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    appBarThemeCubit = MockAppBarThemeCubit();
    appBarActionsIconThemeCubit = MockAppBarActionsIconThemeCubit();
    appBarIconThemeCubit = MockAppBarIconThemeCubit();
    appBarTitleTextStyleCubit = MockAppBarTitleTextStyleCubit();
    colorThemeCubit = MockColorThemeCubit();

    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(
    WidgetTester tester,
    AppBarThemeState themeState, {
    IconThemeState actionsIconThemeState = defaultIconThemeState,
    IconThemeState iconThemeState = defaultIconThemeState,
    TextStyleState? titleTextStyleState,
  }) async {
    whenListen(
      appBarThemeCubit,
      Stream.fromIterable([themeState]),
      initialState: defaultAppBarThemeState,
    );

    whenListen(
      appBarActionsIconThemeCubit,
      Stream.fromIterable([actionsIconThemeState]),
      initialState: defaultIconThemeState,
    );

    whenListen(
      appBarIconThemeCubit,
      Stream.fromIterable([iconThemeState]),
      initialState: defaultIconThemeState,
    );

    final titleTextStyleStateFinal =
        titleTextStyleState ?? defaultTextStyleState;
    whenListen(
      appBarTitleTextStyleCubit,
      Stream.fromIterable([titleTextStyleStateFinal]),
      initialState: defaultTextStyleState,
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: appBarThemeCubit),
          BlocProvider.value(value: appBarActionsIconThemeCubit),
          BlocProvider.value(value: appBarIconThemeCubit),
          BlocProvider.value(value: appBarTitleTextStyleCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: AppBarThemeEditor(),
          ),
        ),
      ),
    );
  }

  testWidgets('displays nested editors', (tester) async {
    await _pumpApp(tester, defaultAppBarThemeState);
    expect(find.byType(ActionsIconThemeCard), findsOneWidget);
    expect(find.byType(IconThemeCard), findsOneWidget);
    expect(find.byType(TitleTextStyleCard), findsOneWidget);
  });

  testWidgets('updates background color', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(backgroundColor: color),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkColorPicker(
      tester,
      'appBarThemeEditor_backgroundColorPicker',
      color,
    );
    verify(() => appBarThemeCubit.backgroundColorChanged(color)).called(1);
  });

  testWidgets('updates foreground color', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(foregroundColor: color),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkColorPicker(
      tester,
      'appBarThemeEditor_foregroundColorPicker',
      color,
    );
    verify(() => appBarThemeCubit.foregroundColorChanged(color)).called(1);
  });

  testWidgets('updates elevation', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(elevation: doubleNum),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'appBarThemeEditor_elevationTextField',
      doubleNum,
    );
    verify(() => appBarThemeCubit.elevationChanged(doubleStr)).called(1);
  });

  testWidgets('updates shadow color', (tester) async {
    final state = AppBarThemeState(theme: AppBarTheme(shadowColor: color));

    await _pumpApp(tester, state);

    await widgetTesters.checkColorPicker(
      tester,
      'appBarThemeEditor_shadowColorPicker',
      color,
    );
    verify(() => appBarThemeCubit.shadowColorChanged(color)).called(1);
  });

  group('tests center title switch', () {
    for (var isCenter in [true, false]) {
      testWidgets('updates to $isCenter', (tester) async {
        final state = AppBarThemeState(
          theme: AppBarTheme(centerTitle: isCenter),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'appBarThemeEditor_centerTitleSwitch',
          isCenter,
        );
        verify(() => appBarThemeCubit.centerTitleChanged(!isCenter)).called(1);
      });
    }
  });

  testWidgets('updates title spacing', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(titleSpacing: doubleNum),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'appBarThemeEditor_titleSpacingTextField',
      doubleNum,
    );
    verify(() => appBarThemeCubit.titleSpacingChanged(doubleStr)).called(1);
  });

  testWidgets('updates tool bar height', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(toolbarHeight: doubleNum),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'appBarThemeEditor_toolBarHeightTextField',
      doubleNum,
    );
    verify(() => appBarThemeCubit.toolBarHeightChanged(doubleStr)).called(1);
  });

  group('tests system UI overlay style dropdown', () {
    for (var style in MySystemUiOverlayStyle().values) {
      final styleStr = MySystemUiOverlayStyle().convertToString(style)!;
      testWidgets('updates to ${style.statusBarBrightness}', (tester) async {
        final state = AppBarThemeState(
          theme: AppBarTheme(systemOverlayStyle: style),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkDropbox(
          tester,
          'appBarThemeEditor_systemUiOverlayStyleDropdown',
          styleStr,
        );
        verify(
          () => appBarThemeCubit.systemUiOverlayStyleChanged(styleStr),
        ).called(1);
      });
    }
  });
}
