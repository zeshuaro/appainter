import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/advanced_theme/cubit/cubit.dart';
import 'package:appainter/home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  late HomeRepository homeRepo;
  late HomeCubit homeCubit;
  late AdvancedThemeCubit advancedThemeCubit;
  late ThemeUsage themeUsage;
  late ThemeData themeData;

  setUpAll(() {
    registerFallbackValue(FakeThemeData());
  });

  setUp(() {
    homeRepo = MockHomeRepository();
    advancedThemeCubit = MockAdvancedThemeCubit();
    homeCubit = HomeCubit(homeRepo, advancedThemeCubit);
    themeUsage = const ThemeUsage();
    themeData = ThemeData();
  });

  group('test edit mode', () {
    for (var mode in EditMode.values) {
      blocTest<HomeCubit, HomeState>(
        'should emit $mode',
        build: () => homeCubit,
        act: (cubit) => cubit.editModeChanged(mode),
        expect: () => [HomeState(editMode: mode)],
      );
    }
  });

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
      },
    );
  });

  blocTest<HomeCubit, HomeState>(
    'should emit theme exported',
    setUp: () => when(() => homeRepo.exportTheme(any())).thenAnswer(
      (invocation) => Future.value(null),
    ),
    build: () => homeCubit,
    act: (cubit) => cubit.themeExported(themeData),
    verify: (bloc) => verify(() => homeRepo.exportTheme(themeData)).called(1),
  );

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
