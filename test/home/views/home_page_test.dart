import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/cubit/basic_theme_cubit.dart';
import 'package:appainter/basic_theme/views/basic_editor.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/theme_preview/theme_preview.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../pump_app.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized()
          as TestWidgetsFlutterBinding;

  late HomeRepository homeRepo;
  late HomeCubit homeCubit;
  late BasicThemeCubit basicThemeCubit;
  late AdvancedThemeCubit advancedThemeCubit;

  setUpAll(() {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeBasicThemeState());
    registerFallbackValue(FakeAdvancedThemeState());
    registerFallbackValue(FakeAppBarThemeState());
    registerFallbackValue(FakeTabBarThemeState());
    registerFallbackValue(FakeBottomNavigationBarThemeState());
    registerFallbackValue(FakeThemeData());
  });

  setUp(() {
    homeRepo = MockHomeRepository();
    homeCubit = MockHomeCubit();
    basicThemeCubit = MockBasicThemeCubit();
    advancedThemeCubit = MockAdvancedThemeCubit();

    when(() => homeCubit.state).thenReturn(const HomeState());
    when(() => homeCubit.themeUsageFetched()).thenAnswer((_) async => {});
    when(() => basicThemeCubit.state).thenReturn(const BasicThemeState());
  });

  Future<void> _pumpApp(WidgetTester tester) async {
    await tester.pumpApp(
      const HomePage(),
      homeRepo: homeRepo,
      homeCubit: homeCubit,
      basicThemeCubit: basicThemeCubit,
      advancedThemeCubit: advancedThemeCubit,
    );
  }

  testWidgets('should display HomePage', (tester) async {
    await _pumpApp(tester);

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(BasicEditor), findsOneWidget);
    expect(find.byType(ThemePreview), findsOneWidget);
  });

  group('edit mode tab', () {
    for (var mode in EditMode.values) {
      testWidgets(
        'editor should change to $mode',
        (tester) async {
          binding.window.physicalSizeTestValue = const Size(1280, 720);
          binding.window.devicePixelRatioTestValue = 1.0;

          when(() => homeCubit.state).thenReturn(HomeState(editMode: mode));

          await _pumpApp(tester);

          final text = UtilService.enumToString(mode);
          final finder = find.byKey(Key('homePage_editModeTabBar_$text'));
          await tester.ensureVisible(finder);
          await tester.tap(finder);
          await tester.pumpAndSettle();

          final editorType =
              mode == EditMode.basic ? BasicEditor : AdvancedEditor;
          expect(find.byType(editorType), findsOneWidget);
          verify(() => homeCubit.editModeChanged(mode)).called(1);

          addTearDown(binding.window.clearPhysicalSizeTestValue);
        },
      );
    }
  });

  group('export theme', () {
    testWidgets(
      'export button should export theme from basic editor',
      (tester) async {
        when(() => homeCubit.state).thenReturn(
          const HomeState(editMode: EditMode.basic),
        );
        when(() => basicThemeCubit.state).thenReturn(const BasicThemeState());
        when(() => homeRepo.exportTheme(any())).thenAnswer((_) async => {});

        await _pumpApp(tester);

        final finder = find.byKey(const Key('homePage_exportButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);

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
        when(() => homeRepo.exportTheme(any())).thenAnswer((_) async => {});

        await _pumpApp(tester);

        final finder = find.byKey(const Key('homePage_exportButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pumpAndSettle();

        verify(() => homeCubit.themeExported(any())).called(1);
      },
    );
  });

  testWidgets(
    'import button should import theme to advanced editor',
    (tester) async {
      await _pumpApp(tester);

      final finder = find.byKey(const Key('homePage_importButton'));
      await tester.ensureVisible(finder);
      await tester.tap(finder);

      verify(() => homeCubit.themeImported()).called(1);
    },
  );

  group('usage button', () {
    testWidgets(
      'should show usage dialog when usage data is available',
      (tester) async {
        const usageData = "usageData";
        when(() => homeCubit.state).thenReturn(
          const HomeState(themeUsage: ThemeUsage(usageData)),
        );

        await _pumpApp(tester);

        final finder = find.byKey(const Key('homePage_usageButton'));
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
          const HomeState(themeUsage: ThemeUsage()),
        );

        await _pumpApp(tester);

        final finder = find.byKey(const Key('homePage_usageButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pumpAndSettle();

        expect(
            find.byKey(const Key('usageButton_usageFallback')), findsOneWidget);
      },
    );

    testWidgets(
      'should show usage dialog with loading when usage data is loading',
      (tester) async {
        when(() => homeCubit.state)
            .thenReturn(const HomeState(themeUsage: null));

        await _pumpApp(tester);

        final finder = find.byKey(const Key('homePage_usageButton'));
        await tester.ensureVisible(finder);
        await tester.tap(finder);
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      },
    );

    testWidgets(
      'should close usage dialog with close button',
      (tester) async {
        await _pumpApp(tester);

        final usageBtn = find.byKey(const Key('homePage_usageButton'));
        await tester.ensureVisible(usageBtn);
        await tester.tap(usageBtn);
        await tester.pump();

        final closeBtn = find.byKey(const Key('usageButton_closeButton'));
        await tester.ensureVisible(closeBtn);
        await tester.tap(closeBtn);
        await tester.pump();

        expect(find.byType(AlertDialog), findsNothing);
      },
    );
  });

  testWidgets(
    'should show github button',
    (tester) async {
      await _pumpApp(tester);
      expect(find.byKey(const Key('homePage_githubButton')), findsOneWidget);
    },
  );

  group('SDK snack bar', () {
    testWidgets(
      'should show',
      (tester) async {
        whenListen(
          homeCubit,
          Stream.fromIterable([const HomeState(isSdkShowed: false)]),
        );

        await _pumpApp(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Supported Flutter SDK'), findsOneWidget);
      },
    );

    testWidgets(
      'should not show',
      (tester) async {
        whenListen(
          homeCubit,
          Stream.fromIterable([const HomeState(isSdkShowed: true)]),
        );

        await _pumpApp(tester);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.byType(SnackBar), findsNothing);
        expect(find.text('Supported Flutter SDK'), findsNothing);
      },
    );
  });
}
