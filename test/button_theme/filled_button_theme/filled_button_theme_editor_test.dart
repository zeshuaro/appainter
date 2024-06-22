import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

Future<void> main() async {
  late ColorThemeCubit colorThemeCubit;
  late FilledButtonThemeEditor sut;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = const FilledButtonThemeEditor();
  });

  test('header', () => expect(sut.header, equals('Filled button')));
}
