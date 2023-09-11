import 'dart:io';

import 'package:appainter/font/font.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  PathProviderPlatform.instance = _MockPathProvider();
  HttpOverrides.global = null;

  final expectedStyle = GoogleFonts.getFont('ABeeZee');
  late FontRepository repo;

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

class _MockPathProvider extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async {
    return 'docs';
  }

  @override
  Future<String?> getDownloadsPath() async {
    return 'downloads';
  }

  @override
  Future<String?> getTemporaryPath() async {
    return 'temp';
  }
}
