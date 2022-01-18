import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late HomeCubit cubit;

  setUp(() {
    cubit = MockHomeCubit();
  });

  Future<void> _pumpApp(WidgetTester tester, [Brightness? brightness]) async {
    await tester.pumpWidget(
      BlocProvider.value(
        value: cubit,
        child: MaterialApp(
          home: Scaffold(
            body: MediaQuery(
              data: MediaQueryData(
                platformBrightness: brightness ?? Brightness.light,
              ),
              child: const AppThemeModeSwitch(),
            ),
          ),
        ),
      ),
    );
  }

  group('test light and dark theme modes', () {
    for (var mode in [ThemeMode.dark, ThemeMode.light]) {
      testWidgets('should update to $mode', (tester) async {
        final isDark = mode == ThemeMode.dark;
        when(() => cubit.state).thenReturn(HomeState(themeMode: mode));
        when(() => cubit.themeModeChanged(any())).thenAnswer(
          (invocation) => Future.value(),
        );

        await _pumpApp(tester);

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == isDark,
        );
        expect(widget, findsOneWidget);
        verify(() => cubit.themeModeChanged(!isDark)).called(1);
      });
    }
  });

  group('test system theme mode', () {
    for (var brightness in Brightness.values) {
      testWidgets('should build switch with $brightness', (tester) async {
        final isDark = brightness == Brightness.dark;
        when(() => cubit.state).thenReturn(
          const HomeState(themeMode: ThemeMode.system),
        );

        await _pumpApp(tester, brightness);

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == isDark,
        );
        expect(widget, findsOneWidget);
      });
    }
  });
}
