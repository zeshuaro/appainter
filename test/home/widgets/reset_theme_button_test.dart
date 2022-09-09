import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/cubit/basic_theme_cubit.dart';
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
          home: Scaffold(body: ResetThemeButton()),
        ),
      ),
    );
  }

  testWidgets('should reset basic theme', (tester) async {
    when(() => homeCubit.state).thenReturn(
      const HomeState(editMode: EditMode.basic),
    );

    await pumpApp(tester);

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(() => basicThemeCubit.themeReset()).called(1);
    verifyNever(() => advancedThemeCubit.themeReset());
  });

  testWidgets('should reset advanced theme', (tester) async {
    when(() => homeCubit.state).thenReturn(
      const HomeState(editMode: EditMode.advanced),
    );

    await pumpApp(tester);

    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    verify(() => advancedThemeCubit.themeReset()).called(1);
    verifyNever(() => basicThemeCubit.themeReset());
  });
}
