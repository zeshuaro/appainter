import 'package:appainter/font/font.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late TextThemeCubit cubit;

  setUp(() {
    cubit = MockTextThemeCubit();
  });

  testWidgets('font picker should update font family', (tester) async {
    const fontFamily = 'ABeeZee';
    final style = GoogleFonts.aBeeZee();

    whenListen(
      cubit,
      Stream.fromIterable([const TextThemeState(fontFamily: fontFamily)]),
      initialState: const TextThemeState(),
    );

    await tester.pumpWidget(
      RepositoryProvider(
        create: (context) => FontRepository(),
        child: BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: FontPicker(
                onChanged: cubit.fontFamilyChanged,
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('fontPicker')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('fontPicker_$fontFamily')));
    await tester.pumpAndSettle();

    expect(find.text(fontFamily), findsOneWidget);
    verify(() => cubit.fontFamilyChanged(FontData(fontFamily, style)));
  });
}
