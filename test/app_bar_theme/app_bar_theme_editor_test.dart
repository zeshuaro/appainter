import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/models/models.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../widget_testers.dart';

void main() {
  final widgetTesters = WidgetTesters(expandText: 'App Bar');

  late AppBarThemeCubit appBarThemeCubit;
  late ColorThemeCubit colorThemeCubit;
  late Color color;
  late double doubleValue;

  setUp(() {
    appBarThemeCubit = MockAppBarThemeCubit();
    colorThemeCubit = MockColorThemeCubit();
    color = getRandomColor();
    doubleValue = Random().nextDouble();

    when(() => appBarThemeCubit.state).thenReturn(const AppBarThemeState());
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AppBarThemeState state) async {
    whenListen(
      appBarThemeCubit,
      Stream.fromIterable([const AppBarThemeState(), state]),
    );

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: appBarThemeCubit),
          BlocProvider.value(value: colorThemeCubit),
        ],
        child: MaterialApp(
          home: MyExpansionPanelList(item: const AppBarThemeEditor()),
        ),
      ),
    );
  }

  testWidgets(
    'background color picker should update with selected color',
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
    'foreground color picker should update with selected color',
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

  testWidgets('elevation should update with value', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(elevation: doubleValue),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'appBarThemeEditor_elevationTextField',
      doubleValue,
    );
    verify(() {
      appBarThemeCubit.elevationChanged(doubleValue.toString());
    }).called(1);
  });

  testWidgets(
    'shadow color picker should update with selected color',
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
      testWidgets('should be toggled to $isCenter', (tester) async {
        final state = AppBarThemeState(
          theme: AppBarTheme(centerTitle: isCenter),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'appBarThemeEditor_centerTitleSwitch',
          isCenter,
        );
        verify(() {
          appBarThemeCubit.centerTitleChanged(!isCenter);
        }).called(1);
      });
    }
  });

  testWidgets('title spacing should update with value', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(titleSpacing: doubleValue),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'appBarThemeEditor_titleSpacingTextField',
      doubleValue,
    );
    verify(() {
      appBarThemeCubit.titleSpacingChanged(doubleValue.toString());
    }).called(1);
  });

  testWidgets('tool bar height should update with value', (tester) async {
    final state = AppBarThemeState(
      theme: AppBarTheme(toolbarHeight: doubleValue),
    );

    await _pumpApp(tester, state);

    await widgetTesters.checkTextField(
      tester,
      'appBarThemeEditor_toolBarHeightTextField',
      doubleValue,
    );
    verify(() {
      appBarThemeCubit.toolBarHeightChanged(doubleValue.toString());
    }).called(1);
  });

  group('test system UI overlay style dropdown', () {
    for (var style in MySystemUiOverlayStyle().values) {
      final styleStr = MySystemUiOverlayStyle().stringFromEnum(style)!;
      testWidgets(
        'should update to ${style.statusBarBrightness}',
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
          verify(() {
            appBarThemeCubit.systemUiOverlayStyleChanged(styleStr);
          }).called(1);
        },
      );
    }
  });
}
