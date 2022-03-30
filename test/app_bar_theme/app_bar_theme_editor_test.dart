import 'dart:math';

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
  final widgetTesters = WidgetTesters();

  late AppBarThemeCubit appBarThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    appBarThemeCubit = MockAppBarThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();

    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AppBarThemeState state) async {
    whenListen(
      appBarThemeCubit,
      Stream.fromIterable([state]),
      initialState: const AppBarThemeState(),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: appBarThemeCubit),
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

  testWidgets(
    'updates background color',
    (tester) async {
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
    },
  );

  testWidgets(
    'updates foreground color',
    (tester) async {
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
    },
  );

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

  testWidgets(
    'updates shadow color',
    (tester) async {
      final state = AppBarThemeState(theme: AppBarTheme(shadowColor: color));

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'appBarThemeEditor_shadowColorPicker',
        color,
      );
      verify(() => appBarThemeCubit.shadowColorChanged(color)).called(1);
    },
  );

  group('test center title switch', () {
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

  group('test system UI overlay style dropdown', () {
    for (var style in MySystemUiOverlayStyle().values) {
      final styleStr = MySystemUiOverlayStyle().convertToString(style)!;
      testWidgets(
        'updates to ${style.statusBarBrightness}',
        (tester) async {
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
        },
      );
    }
  });

  group('test actions icon theme', () {
    final widgetTesters = WidgetTesters(expandText: 'Actions icon theme');

    testWidgets(
      'updates color',
      (tester) async {
        final state = AppBarThemeState(
          theme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: color),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkColorPicker(
          tester,
          'appbarThemeEditor_actionsIconThemeCard_colorPicker',
          color,
        );
        verify(
          () => appBarThemeCubit.actionsIconThemeColorChanged(color),
        ).called(1);
      },
    );

    testWidgets(
      'updates size',
      (tester) async {
        final state = AppBarThemeState(
          theme: AppBarTheme(
            actionsIconTheme: IconThemeData(size: doubleNum),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'appbarThemeEditor_actionsIconThemeCard_sizeTextField',
          doubleNum,
        );
        verify(
          () => appBarThemeCubit.actionsIconThemeSizeChanged(doubleStr),
        ).called(1);
      },
    );

    testWidgets(
      'updates opacity',
      (tester) async {
        final state = AppBarThemeState(
          theme: AppBarTheme(
            actionsIconTheme: IconThemeData(opacity: doubleNum),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkTextField(
          tester,
          'appbarThemeEditor_actionsIconThemeCard_opacityTextField',
          doubleNum,
        );
        verify(
          () => appBarThemeCubit.actionsIconThemeOpacityChanged(doubleStr),
        ).called(1);
      },
    );
  });
}
