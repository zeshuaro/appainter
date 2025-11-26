import 'package:appainter/font/font.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
  const fontFamily = 'ABeeZee';

  testWidgets('font picker should update font family', (tester) async {
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

  testWidgets(
      'font picker should load $fontFamily font family when initial is $fontFamily',
      (tester) async {
    await tester.pumpWidget(
      RepositoryProvider(
        create: (context) => FontRepository(),
        child: BlocProvider.value(
          value: cubit,
          child: MaterialApp(
            home: Scaffold(
              body: FontPicker(
                onChanged: cubit.fontFamilyChanged,
                initial: fontFamily,
              ),
            ),
          ),
        ),
      ),
    );

    final picker = tester
        .widget<DropdownSearch<FontData>>(find.byKey(const Key('fontPicker')));

    expect(picker.selectedItems.length, isNot(equals(0)));
    expect(picker.selectedItems.first.family, equals(fontFamily));
  });

  testWidgets(
      'font picker should load default font family when initial is null',
      (tester) async {
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

    final picker = tester
        .widget<DropdownSearch<FontData>>(find.byKey(const Key('fontPicker')));

    expect(picker.selectedItems.length, isNot(equals(0)));
    expect(picker.selectedItems.first.family,
        equals(FontData.defaultFontData().family));
  });
}
