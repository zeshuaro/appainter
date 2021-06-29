import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/home/home.dart';

void main() {
  late HomeCubit cubit;

  setUp(() => cubit = HomeCubit());

  test('initial state is HomeState', () {
    expect(cubit.state, equals(HomeState()));
  });

  group('editModeChanged', () {
    for (var mode in EditMode.values) {
      blocTest<HomeCubit, HomeState>(
        'emits edit mode',
        build: () => cubit,
        act: (cubit) => cubit.editModeChanged(mode),
        expect: () => [HomeState(editMode: mode)],
      );
    }
  });
}
