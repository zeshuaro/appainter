import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final expectedStyle = GoogleFonts.getFont('ABeeZee');
  late TextThemeRepository repo;

  setUp(() {
    repo = TextThemeRepository();
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
