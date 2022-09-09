import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../pump_app.dart';

void main() {
  const key = Key('exportButton');

  late HomeRepository homeRepo;
  late HomeCubit homeCubit;
  late BasicThemeCubit basicThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;

  setUpAll(() {
    registerFallbackValue(FakeThemeData());
  });

  setUp(() {
    homeRepo = MockHomeRepository();
    homeCubit = MockHomeCubit();
    basicThemeCubit = MockBasicThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();

    when(() => homeCubit.themeExported(any())).thenAnswer(
      (_) => Future.value(),
    );
    when(() => homeRepo.exportTheme(any())).thenAnswer(
      (_) => Future.value(true),
    );
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpApp(
      const ExportButton(
        key: key,
        color: Colors.white,
      ),
      homeRepo: homeRepo,
      homeCubit: homeCubit,
      basicThemeCubit: basicThemeCubit,
      advancedThemeCubit: advancedThemeCubit,
    );
  }

  testWidgets(
    'export button should export theme from basic editor',
    (tester) async {
      when(() => homeCubit.state).thenReturn(
        const HomeState(editMode: EditMode.basic),
      );
      when(() => basicThemeCubit.state).thenReturn(BasicThemeState());

      await pumpApp(tester);

      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      verify(
        () => homeCubit.themeExported(basicThemeCubit.state.theme),
      ).called(greaterThan(0));
    },
  );

  testWidgets(
    'export button should export theme from advanced editor',
    (tester) async {
      when(() => homeCubit.state).thenReturn(
        const HomeState(editMode: EditMode.advanced),
      );

      await pumpApp(tester);

      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();

      verify(() => homeCubit.themeExported(any())).called(1);
    },
  );
}
