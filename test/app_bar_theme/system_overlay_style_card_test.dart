import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';
import '../utils.dart';
import '../utils/widget_tester_utils.dart';

void main() {
  const expandText = 'System overlay style';
  const appbarThemeState = AppBarThemeState();
  const systemOverlayStyle = SystemUiOverlayStyle.light;

  late AppBarThemeCubit appBarThemeCubit;
  late Color color;

  setUp(() {
    appBarThemeCubit = MockAppBarThemeCubit();
    color = getRandomColor();
  });

  Future<void> pumpApp(WidgetTester tester, [AppBarThemeState? state]) async {
    when(() => appBarThemeCubit.state).thenReturn(state ?? appbarThemeState);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: appBarThemeCubit,
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const SystemOverlayStyleCard(),
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

  group('status bar color picker', () {
    const key = 'systemOverlayStyleCard_statusBarColorPicker';

    testWidgets('render color', (tester) async {
      final state = AppBarThemeState.withTheme(
        systemUiOverlayStyle: systemOverlayStyle.copyWith(
          statusBarColor: color,
        ),
      );

      await pumpApp(tester, state);

      await tester.expectColorIndicator(key, color);
      expectBlocBuilder(tester, key, state);
    });

    testWidgets('change color', (tester) async {
      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        color.withOpacity(0),
        appBarThemeCubit.statusBarColorChanged,
      );
    });
  });

  group('status bar brightness dropdown', () {
    const key = 'systemOverlayStyleCard_statusBarBrightnessDropdown';

    for (var brightness in Brightness.values) {
      final brightnessStr = UtilService.enumToString(brightness);

      testWidgets('render $brightness', (tester) async {
        final state = AppBarThemeState.withTheme(
          systemUiOverlayStyle: systemOverlayStyle.copyWith(
            statusBarBrightness: brightness,
          ),
        );

        await pumpApp(tester, state);

        await tester.expectDropdown(key, brightnessStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $brightness', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          brightnessStr,
          appBarThemeCubit.statusBarBrightnessChanged,
        );
      });
    }
  });

  group('status bar icon brightness dropdown', () {
    const key = 'systemOverlayStyleCard_statusBarIconBrightnessDropdown';

    for (var brightness in Brightness.values) {
      final brightnessStr = UtilService.enumToString(brightness);

      testWidgets('render $brightness', (tester) async {
        final state = AppBarThemeState.withTheme(
          systemUiOverlayStyle: systemOverlayStyle.copyWith(
            statusBarIconBrightness: brightness,
          ),
        );

        await pumpApp(tester, state);

        await tester.expectDropdown(key, brightnessStr);
        expectBlocBuilder(tester, key, state);
      });

      testWidgets('change $brightness', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          brightnessStr,
          appBarThemeCubit.statusBarIconBrightnessChanged,
        );
      });
    }
  });
}
