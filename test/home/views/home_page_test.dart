import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
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

class MockThemeService extends Mock implements ThemeService {}

class FakeHomeState extends Fake implements HomeState {}

class FakeBasicThemeState extends Fake implements BasicThemeState {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  late HomeCubit homeCubit;
  late BasicThemeCubit basicThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;
  late ThemeService themeService;

  setUpAll(() {
    registerFallbackValue<HomeState>(FakeHomeState());
    registerFallbackValue<BasicThemeState>(FakeBasicThemeState());
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());
    registerFallbackValue<ThemeData>(ThemeData());
  });

  setUp(() {
    homeCubit = MockHomeCubit();
    basicThemeCubit = MockBasicThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();
    themeService = MockThemeService();

    when(() => homeCubit.state).thenReturn(HomeState());
    when(() => homeCubit.themeUsageFetched()).thenAnswer((_) async => {});
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

  group('export theme', () {
    testWidgets(
      'export button should export theme from basic editor',
      (tester) async {
        when(() => homeCubit.state).thenReturn(
          HomeState(editMode: EditMode.basic),
        );
        when(() => basicThemeCubit.state).thenReturn(BasicThemeState());
        when(() => themeService.export(any())).thenAnswer((_) async => {});

        await tester.pumpApp(
          HomePage(
            themeService: themeService,
          ),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(Key('homePage_exportBtn'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);

        verify(() {
          return themeService.export(basicThemeCubit.state.themeData);
        }).called(greaterThan(0));
      },
    );

    testWidgets(
      'export button should export theme from advanced editor',
      (tester) async {
        when(() => homeCubit.state).thenReturn(
          HomeState(editMode: EditMode.advanced),
        );
        when(() => advancedThemeCubit.state).thenReturn(AdvancedThemeState());
        when(() => themeService.export(any())).thenAnswer((_) async => {});

        await tester.pumpApp(
          HomePage(
            themeService: themeService,
          ),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(Key('homePage_exportBtn'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);

        verify(() {
          return themeService.export(advancedThemeCubit.state.themeData);
        }).called(greaterThan(0));
      },
    );
  });

  testWidgets(
    'import button should import theme to advanced editor',
    (tester) async {
      final theme = ThemeData();
      when(() => homeCubit.state).thenReturn(
        HomeState(editMode: EditMode.basic),
      );
      when(() => themeService.import()).thenAnswer((_) async => theme);

      await tester.pumpApp(
        HomePage(
          themeService: themeService,
        ),
        homeCubit: homeCubit,
        basicThemeCubit: basicThemeCubit,
        advancedThemeCubit: advancedThemeCubit,
      );

      final finder = find.byKey(Key('homePage_importBtn'));
      await tester.ensureVisible(finder);
      await tester.tap(finder);

      verify(() => themeService.import()).called(greaterThan(0));
      verify(() => advancedThemeCubit.themeDataChanged(theme)).called(1);
      verify(() => homeCubit.editModeChanged(EditMode.advanced)).called(1);
    },
  );

  group('usage button', () {
    testWidgets(
      'should show usage dialog when usage data is available',
      (tester) async {
        final usageData = "usageData";
        when(() => homeCubit.state).thenReturn(
          HomeState(themeUsage: ThemeUsage(usageData)),
        );

        await tester.pumpApp(
          HomePage(
            themeService: themeService,
          ),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(Key('homePage_usageBtn'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pumpAndSettle();

        expect(
          find.byWidgetPredicate((widget) {
            return widget is Markdown && widget.data == usageData;
          }),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show usage dialog with warning when usage data is unavailable',
      (tester) async {
        when(() => homeCubit.state).thenReturn(
          HomeState(themeUsage: ThemeUsage()),
        );

        await tester.pumpApp(
          HomePage(
            themeService: themeService,
          ),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(Key('homePage_usageBtn'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pumpAndSettle();

        expect(find.byKey(const Key('usageBtn_usageFallback')), findsOneWidget);
      },
    );

    testWidgets(
      'should show usage dialog with loading when usage data is loading',
      (tester) async {
        when(() => homeCubit.state).thenReturn(HomeState(themeUsage: null));

        await tester.pumpApp(
          HomePage(
            themeService: themeService,
          ),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final finder = find.byKey(Key('homePage_usageBtn'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'should close usage dialog with close button',
      (tester) async {
        await tester.pumpApp(
          HomePage(
            themeService: themeService,
          ),
          homeCubit: homeCubit,
          basicThemeCubit: basicThemeCubit,
          advancedThemeCubit: advancedThemeCubit,
        );

        final usageBtn = find.byKey(Key('homePage_usageBtn'));
        await tester.ensureVisible(usageBtn);
        await tester.tap(usageBtn);
        await tester.pump();

        final closeBtn = find.byKey(Key('usageBtn_closeBtn'));
        await tester.ensureVisible(closeBtn);
        await tester.tap(closeBtn);
        await tester.pump();

        expect(find.byType(AlertDialog), findsNothing);
      },
    );
  });
}
