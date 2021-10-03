import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepo extends Mock implements HomeRepo {}

void main() {
  final homeRepo = MockHomeRepo();
  late HomeCubit cubit;

  setUp(() => cubit = HomeCubit(homeRepo));

  test('initial state should equal to HomeState', () {
    expect(cubit.state, equals(const HomeState()));
  });

  group('editModeChanged', () {
    for (var mode in EditMode.values) {
      blocTest<HomeCubit, HomeState>(
        'should emit $mode',
        build: () => cubit,
        act: (cubit) => cubit.editModeChanged(mode),
        expect: () => [HomeState(editMode: mode)],
      );
    }
  });

  group('themeUsageFetched', () {
    const themeUsage = ThemeUsage();
    when(() => homeRepo.fetchThemeUsage()).thenAnswer((invocation) {
      return Future.value(themeUsage);
    });

    blocTest<HomeCubit, HomeState>(
      'should emit theme usage fetched',
      build: () => cubit,
      act: (cubit) => cubit.themeUsageFetched(),
      expect: () => [const HomeState(themeUsage: themeUsage)],
    );
  });

  group('sdkShowed', () {
    blocTest<HomeCubit, HomeState>(
      'should emit sdk showed',
      build: () => cubit,
      act: (cubit) => cubit.sdkShowed(),
      expect: () => [const HomeState(isSdkShowed: true)],
    );
  });
}
