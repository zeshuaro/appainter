import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:flutter_theme/basic_theme/views/basic_editor.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:flutter_theme/theme_preview/theme_preview.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockBasicThemeCubit extends MockCubit<BasicThemeState>
    implements BasicThemeCubit {}

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeHomeState extends Fake implements HomeState {}

class FakeBasicThemeState extends Fake implements BasicThemeState {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  late HomeCubit homeCubit;
  late BasicThemeCubit basicThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;

  setUpAll(() {
    registerFallbackValue<HomeState>(FakeHomeState());
    registerFallbackValue<BasicThemeState>(FakeBasicThemeState());
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
  });

  setUp(() {
    homeCubit = MockHomeCubit();
    basicThemeCubit = MockBasicThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();

    when(() => homeCubit.state).thenReturn(HomeState());
    when(() => basicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => advancedThemeCubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('displays HomePage', (tester) async {
    await tester.pumpApp(
      HomePage(),
      homeCubit: homeCubit,
      basicThemeCubit: basicThemeCubit,
      advancedThemeCubit: advancedThemeCubit,
    );

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(BasicEditor), findsOneWidget);
    expect(find.byType(ThemePreview), findsOneWidget);
  });

  group('edit mode tab', () {
    for (var mode in EditMode.values) {
      testWidgets(
        'editor should change to $mode',
        (tester) async {
          when(() => homeCubit.state).thenReturn(HomeState(editMode: mode));

          await tester.pumpApp(
            HomePage(),
            homeCubit: homeCubit,
            basicThemeCubit: basicThemeCubit,
            advancedThemeCubit: advancedThemeCubit,
          );

          final finder = find.text(UtilService.enumToString(mode));
          await tester.ensureVisible(finder);
          await tester.tap(finder);
          await tester.pumpAndSettle();

          final editorType =
              mode == EditMode.basic ? BasicEditor : AdvancedEditor;
          expect(find.byType(editorType), findsOneWidget);
          verify(() {
            homeCubit.editModeChanged(mode);
          }).called(greaterThanOrEqualTo(1));
        },
      );
    }
  });

  group('randomize theme', () {
    testWidgets(
      'randomize theme should be requested for basic editor',
      (tester) async {
        when(() {
          return homeCubit.state;
        }).thenReturn(HomeState(editMode: EditMode.basic));

        await tester.pumpApp(
          HomePage(),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(const Key('homePage_randomizeThemeButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);

        verify(() => basicThemeCubit.randomizedThemeRequested()).called(1);
        verifyNever(() => advancedThemeCubit.randomizedThemeRequested());
      },
    );

    testWidgets(
      'randomize theme should be requested for advanced editor',
      (tester) async {
        when(() {
          return homeCubit.state;
        }).thenReturn(HomeState(editMode: EditMode.advanced));

        await tester.pumpApp(
          HomePage(),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(
          const Key('homePage_randomizeThemeButton'),
        );
        await tester.ensureVisible(finder);
        await tester.tap(finder);

        verify(() => advancedThemeCubit.randomizedThemeRequested()).called(1);
        verifyNever(() => basicThemeCubit.randomizedThemeRequested());
      },
    );
  });

  group('reset theme', () {
    testWidgets(
      'reset theme should be requested for basic editor',
      (tester) async {
        when(() {
          return homeCubit.state;
        }).thenReturn(HomeState(editMode: EditMode.basic));

        await tester.pumpApp(
          HomePage(),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(const Key('homePage_resetThemeButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);

        verify(() => basicThemeCubit.defaultThemeRequested()).called(1);
        verifyNever(() => advancedThemeCubit.defaultThemeRequested());
      },
    );

    testWidgets(
      'reset theme should be requested for advanced editor',
      (tester) async {
        when(() {
          return homeCubit.state;
        }).thenReturn(HomeState(editMode: EditMode.advanced));

        await tester.pumpApp(
          HomePage(),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(const Key('homePage_resetThemeButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);

        verify(() => advancedThemeCubit.defaultThemeRequested()).called(1);
        verifyNever(() => basicThemeCubit.defaultThemeRequested());
      },
    );
  });
}
