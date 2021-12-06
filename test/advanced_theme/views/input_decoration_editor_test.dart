import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../pump_app.dart';
import '../../utils.dart';
import '../../widget_testers.dart';

void main() {
  final widget = MyExpansionPanelList(item: const InputDecorationEditor());
  final widgetTesters = WidgetTesters(expandText: 'Input Decoration');
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester, AdvancedThemeState state) async {
    whenListen(
      cubit,
      Stream.fromIterable([AdvancedThemeState(), state]),
    );

    await tester.pumpApp(widget, advancedThemeCubit: cubit);
  }

  testWidgets('displays InputDecorationEditor', (tester) async {
    await tester.pumpApp(widget, advancedThemeCubit: cubit);
    expect(find.byType(InputDecorationEditor), findsOneWidget);
  });

  testWidgets(
    'fill color picker should update with color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          inputDecorationTheme: InputDecorationTheme(fillColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'inputDecorationEditor_fillColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'hover color picker should update with color',
    (tester) async {
      final color = getRandomColor();
      final state = AdvancedThemeState(
        themeData: ThemeData(
          inputDecorationTheme: InputDecorationTheme(hoverColor: color),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkColorPicker(
        tester,
        'inputDecorationEditor_hoverColorPicker',
        color,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  for (var shouldAlign in [true, false]) {
    testWidgets(
      'align label with hint should be toggled to $shouldAlign',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              alignLabelWithHint: shouldAlign,
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'inputDecorationEditor_alignLabelWithHintSwitch',
          shouldAlign,
        );

        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              alignLabelWithHint: !shouldAlign,
            ),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  for (var isFilled in [true, false]) {
    testWidgets(
      'filled should be toggled to $isFilled',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              filled: isFilled,
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'inputDecorationEditor_filledSwitch',
          isFilled,
        );

        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              filled: !isFilled,
            ),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  for (var isCollapsed in [true, false]) {
    testWidgets(
      'is collapsed should be toggled to $isCollapsed',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              isCollapsed: isCollapsed,
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'inputDecorationEditor_isCollapsedSwitch',
          isCollapsed,
        );

        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              isCollapsed: !isCollapsed,
            ),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  for (var isDense in [true, false]) {
    testWidgets(
      'is dense should be toggled to $isDense',
      (tester) async {
        final state = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              isDense: isDense,
            ),
          ),
        );

        await _pumpApp(tester, state);

        await widgetTesters.checkSwitch(
          tester,
          'inputDecorationEditor_isDenseSwitch',
          isDense,
        );

        final expectedState = AdvancedThemeState(
          themeData: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              isDense: !isDense,
            ),
          ),
        );
        verify(() => cubit.emit(expectedState)).called(1);
      },
    );
  }

  testWidgets(
    'error max lines should update with value',
    (tester) async {
      const value = kInputDecorationErrorMaxLines + 1;
      final state = AdvancedThemeState(
        themeData: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            errorMaxLines: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'inputDecorationEditor_errorMaxLinesTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );

  testWidgets(
    'helper max lines should update with value',
    (tester) async {
      const value = kInputDecorationHelperMaxLines + 1;
      final state = AdvancedThemeState(
        themeData: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            helperMaxLines: value,
          ),
        ),
      );

      await _pumpApp(tester, state);

      await widgetTesters.checkTextField(
        tester,
        'inputDecorationEditor_helperMaxLinesTextField',
        value,
      );
      verify(() => cubit.emit(state)).called(1);
    },
  );
}
