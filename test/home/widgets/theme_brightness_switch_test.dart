import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late HomeCubit homeCubit;
  late BasicThemeCubit basicThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;

  setUp(() {
    homeCubit = MockHomeCubit();
    basicThemeCubit = MockBasicThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: homeCubit),
          BlocProvider.value(value: basicThemeCubit),
          BlocProvider.value(value: advancedThemeCubit),
        ],
        child: const MaterialApp(
          home: Scaffold(body: ThemeBrightnessSwitch()),
        ),
      ),
    );
  }

  void mockCubits(bool isDark) {
    when(() => basicThemeCubit.state).thenReturn(
      BasicThemeState(isDark: isDark),
    );
    when(() => advancedThemeCubit.state).thenReturn(
      AdvancedThemeState(isDark: isDark),
    );
  }

  group('test switch for basic theme', () {
    for (var isDark in [true, false]) {
      testWidgets('should update to $isDark', (tester) async {
        when(() => homeCubit.state).thenReturn(
          const HomeState(editMode: EditMode.basic),
        );
        mockCubits(isDark);

        await pumpApp(tester);

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == isDark,
        );
        expect(widget, findsOneWidget);
        verify(() => basicThemeCubit.themeBrightnessChanged(!isDark)).called(1);
        verifyNever(() => advancedThemeCubit.themeBrightnessChanged(any()));
      });
    }
  });

  group('test switch for advanced theme', () {
    for (var isDark in [true, false]) {
      testWidgets('should update to $isDark', (tester) async {
        when(() => homeCubit.state).thenReturn(
          const HomeState(editMode: EditMode.advanced),
        );
        mockCubits(isDark);

        await pumpApp(tester);

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == isDark,
        );
        expect(widget, findsOneWidget);
        verify(
          () => advancedThemeCubit.themeBrightnessChanged(!isDark),
        ).called(1);
        verifyNever(() => basicThemeCubit.themeBrightnessChanged(any()));
      });
    }
  });
}
