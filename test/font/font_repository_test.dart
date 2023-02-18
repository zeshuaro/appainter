import 'dart:io';

import 'package:appainter/font/font.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = null;

  late TextStyle expectedStyle;
  late FontRepository repo;

  setUpAll(() {
    expectedStyle = GoogleFonts.getFont('ABeeZee');
  });

  setUp(() {
    repo = FontRepository();
  });

  for (var query in ['ABeeZee', 'abeezee']) {
    test('search fonts should return correct results for query $query', () {
      final results = repo.searchFonts(query);
      expect(results, equals([FontData('ABeeZee', expectedStyle)]));
    });
  }

  test('search fonts should return empty results', () {
    final results = repo.searchFonts('clearlyDoesNotExist');
    expect(results, equals([]));
  });
}
