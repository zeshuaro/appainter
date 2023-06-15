import 'package:appainter/advanced_theme/cubit/cubit.dart';
import 'package:appainter/analytics/analytics.dart';
import 'package:appainter/home/home.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late HomeRepository homeRepo;
  late AnalyticsRepositoryImpl analyticsRepo;
  late HomeCubit homeCubit;
  late AdvancedThemeCubit advancedThemeCubit;
  late ThemeUsage themeUsage;
  late ThemeData themeData;

  setUpAll(() {
    registerFallbackValue(FakeThemeData());
    registerFallbackValue(EditMode.basic);
  });

  setUp(() {
    homeRepo = MockHomeRepository();
    analyticsRepo = MockAnalyticsRepository();
    advancedThemeCubit = MockAdvancedThemeCubit();
    homeCubit = HomeCubit(
      homeRepo: homeRepo,
      advancedThemeCubit: advancedThemeCubit,
      analyticsRepo: analyticsRepo,
    );
    themeUsage = const ThemeUsage();
    themeData = ThemeData();
  });

  blocTest<HomeCubit, HomeState>(
    'does not emit basic edit mode from initial state',
    build: () => homeCubit,
    act: (cubit) => cubit.editModeChanged(EditMode.basic),
    expect: () => [],
    verify: (_) => verifyNever(() => analyticsRepo.logChangeEditMode(any())),
  );

  blocTest<HomeCubit, HomeState>(
    'emits basic edit mode',
    build: () => homeCubit,
    seed: () => const HomeState(editMode: EditMode.advanced),
    act: (cubit) => cubit.editModeChanged(EditMode.basic),
    expect: () => [const HomeState(editMode: EditMode.basic)],
    verify: (_) => verify(
      () => analyticsRepo.logChangeEditMode(EditMode.basic),
    ).called(1),
  );

  blocTest<HomeCubit, HomeState>(
    'emits advanced edit mode',
    build: () => homeCubit,
    act: (cubit) => cubit.editModeChanged(EditMode.advanced),
    expect: () => [const HomeState(editMode: EditMode.advanced)],
    verify: (_) => verify(
      () => analyticsRepo.logChangeEditMode(EditMode.advanced),
    ).called(1),
  );

  blocTest<HomeCubit, HomeState>(
    'should emit theme usage fetched',
    setUp: () => when(() {
      return homeRepo.fetchThemeUsage();
    }).thenAnswer((invocation) => Future.value(themeUsage)),
    build: () => homeCubit,
    act: (cubit) => cubit.themeUsageFetched(),
    expect: () => [HomeState(themeUsage: themeUsage)],
  );

  blocTest<HomeCubit, HomeState>(
    'should emit sdk showed',
    build: () => homeCubit,
    act: (cubit) => cubit.sdkShowed(),
    expect: () => [const HomeState(isSdkShowed: true)],
  );

  group('test import theme', () {
    blocTest<HomeCubit, HomeState>(
      'should emit with theme data',
      setUp: () => when(() => homeRepo.importTheme()).thenAnswer((invocation) {
        return Future.value(themeData);
      }),
      build: () => homeCubit,
      act: (cubit) => cubit.themeImported(),
      expect: () => [
        const HomeState(isImportingTheme: true),
        const HomeState(isImportingTheme: false),
        const HomeState(editMode: EditMode.advanced),
      ],
      verify: (bloc) {
        verify(() => homeRepo.importTheme()).called(1);
        verify(() => advancedThemeCubit.themeChanged(themeData)).called(1);
        verify(
          () => analyticsRepo.logImportTheme(AnalyticsAction.start),
        ).called(1);
        verify(
          () => analyticsRepo.logImportTheme(AnalyticsAction.complete),
        ).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'should emit with null theme data',
      setUp: () => when(() => homeRepo.importTheme()).thenAnswer((invocation) {
        return Future.value(null);
      }),
      build: () => homeCubit,
      act: (cubit) => cubit.themeImported(),
      expect: () => [
        const HomeState(isImportingTheme: true),
        const HomeState(isImportingTheme: false),
      ],
      verify: (bloc) {
        verify(() => homeRepo.importTheme()).called(1);
        verifyNever(() => advancedThemeCubit.themeChanged(any()));
        verify(
          () => analyticsRepo.logImportTheme(AnalyticsAction.start),
        ).called(1);
        verify(
          () => analyticsRepo.logImportTheme(AnalyticsAction.incomplete),
        ).called(1);
      },
    );
  });

  group('exports theme', () {
    for (var exportResult in [true, false]) {
      blocTest<HomeCubit, HomeState>(
        'emits exported result=$exportResult',
        setUp: () => when(() => homeRepo.exportTheme(any())).thenAnswer(
          (_) => Future.value(exportResult),
        ),
        build: () => homeCubit,
        act: (cubit) => cubit.themeExported(themeData),
        verify: (cubit) {
          verify(() => homeRepo.exportTheme(themeData)).called(1);
          verify(
            () => analyticsRepo.logExportTheme(
              AnalyticsAction.start,
              cubit.state.editMode,
            ),
          ).called(1);
          if (exportResult) {
            verify(
              () => analyticsRepo.logExportTheme(
                AnalyticsAction.complete,
                cubit.state.editMode,
              ),
            ).called(1);
          } else {
            verify(
              () => analyticsRepo.logExportTheme(
                AnalyticsAction.incomplete,
                cubit.state.editMode,
              ),
            ).called(1);
          }
        },
      );
    }
  });

  group('test theme mode fetched', () {
    for (var isDark in [true, false]) {
      blocTest<HomeCubit, HomeState>(
        'should emit theme mode with isDark=$isDark',
        setUp: () => when(() => homeRepo.getIsDarkTheme()).thenAnswer(
          (invocation) => Future.value(isDark),
        ),
        build: () => homeCubit,
        act: (cubit) => cubit.themeModeFetched(),
        expect: () => [
          HomeState(
            status: HomeStatus.success,
            themeMode: homeCubit.getThemeMode(isDark),
          ),
        ],
      );
    }

    blocTest<HomeCubit, HomeState>(
      'should emit theme mode system',
      setUp: () => when(() => homeRepo.getIsDarkTheme()).thenAnswer(
        (invocation) => Future.value(null),
      ),
      build: () => homeCubit,
      act: (cubit) => cubit.themeModeFetched(),
      expect: () => [
        const HomeState(
          status: HomeStatus.success,
          themeMode: ThemeMode.system,
        ),
      ],
    );
  });

  group('test theme mode changed', () {
    for (var isDark in [true, false]) {
      blocTest<HomeCubit, HomeState>(
        'should emit theme mode with isDark=$isDark',
        setUp: () => when(() => homeRepo.setIsDarkTheme(any())).thenAnswer(
          (invocation) => Future.value(null),
        ),
        build: () => homeCubit,
        act: (cubit) => cubit.themeModeChanged(isDark),
        expect: () => [
          HomeState(
            themeMode: homeCubit.getThemeMode(isDark),
          ),
        ],
        verify: (cubit) => verify(
          () => homeRepo.setIsDarkTheme(isDark),
        ).called(1),
      );
    }
  });
}
