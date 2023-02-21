import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

Future<void> main() async {
  late ColorThemeCubit colorThemeCubit;
  late TextButtonThemeEditor sut;

  setUp(() {
    colorThemeCubit = MockColorThemeCubit();
    when(() => colorThemeCubit.state).thenReturn(ColorThemeState());

    sut = const TextButtonThemeEditor();
  });

  test('header', () => expect(sut.header, equals('Text button')));
}
