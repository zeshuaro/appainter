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
          home: Scaffold(body: Material3Switch()),
        ),
      ),
    );
  }

  void mockCubits(bool useMaterial3) {
    when(() => basicThemeCubit.state).thenReturn(
      BasicThemeState(useMaterial3: useMaterial3),
    );
    when(() => advancedThemeCubit.state).thenReturn(
      AdvancedThemeState(useMaterial3: useMaterial3),
    );
  }

  group('test material 3 switch for basic theme', () {
    for (var useMaterial3 in [true, false]) {
      testWidgets('should update to $useMaterial3', (tester) async {
        when(() => homeCubit.state).thenReturn(
          const HomeState(editMode: EditMode.basic),
        );
        mockCubits(useMaterial3);

        await pumpApp(tester);

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == useMaterial3,
        );
        expect(widget, findsOneWidget);
        verify(() => basicThemeCubit.useMaterial3Changed(!useMaterial3))
            .called(1);
        verifyNever(() => advancedThemeCubit.useMaterial3Changed(any()));
      });
    }
  });

  group('test material 3 switch for advanced theme', () {
    for (var useMaterial3 in [true, false]) {
      testWidgets('should update to $useMaterial3', (tester) async {
        when(() => homeCubit.state).thenReturn(
          const HomeState(editMode: EditMode.advanced),
        );
        mockCubits(useMaterial3);

        await pumpApp(tester);

        await tester.tap(find.byType(Switch));
        await tester.pumpAndSettle();

        final widget = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == useMaterial3,
        );
        expect(widget, findsOneWidget);
        verify(
          () => advancedThemeCubit.useMaterial3Changed(!useMaterial3),
        ).called(1);
        verifyNever(() => basicThemeCubit.useMaterial3Changed(any()));
      });
    }
  });
}
